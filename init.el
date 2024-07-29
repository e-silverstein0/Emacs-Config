(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)

(column-number-mode)
(global-display-line-numbers-mode)
(defun my/turn-off-line-numbers ()
  (display-line-numbers-mode -1))
(add-hook 'pdf-view-mode-hook #'my/turn-off-line-numbers)

(setq backup-directory-alist
      `(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/auto-save-list/" t)))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file t)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(use-package catppuccin-theme
  :ensure t)
(load-theme 'catppuccin)

(use-package vertico
  :ensure t
  :config
  (vertico-mode 1))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package pdf-tools
  :ensure t
  :defer t
  :init (pdf-loader-install))

(defun my/latex-mode-hook ()
  (push (list 'output-pdf "PDF Tools") TeX-view-program-selection))

(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode . my/latex-mode-hook))

(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq font-latex-fontify-script nil)

(use-package latex-preview-pane
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package elcord
  :ensure t
  :init (elcord-mode)
  :config
  (setq elcord-quiet 1)
  (setq elcord-use-major-mode-as-main-icon 1)
  (add-to-list 'elcord-mode-icon-alist '(LaTeX-mode . "latex-mode_icon")))
