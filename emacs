;;; .emacs --- -*- mode: Emacs-Lisp; -*-

(defvar running-xemacs (string-match "XEmacs\\\\|Lucid" emacs-version))

(setq font-menu-ignore-scaled-fonts nil)

(setq load-path
      (append '(
                "~/lib/lisp"
                )
              load-path
              )
      )

;;(require 'crypt++)
(setq menu-bar-mode t)

;; function key bindings
(global-set-key [f1] 'fill-region)
;(global-set-key [f2] 'vm)
(global-set-key [f3] 'bbdb)
(global-set-key [f4] 'ispell-region)

;; Make F5 be "start macro"
(global-set-key [f5] 'start-kbd-macro)
;; Make F6 be "end macro"
(global-set-key [f6] 'end-kbd-macro)
;; Make F7 be "execute macro"
(global-set-key [f7] 'call-last-kbd-macro)

(global-set-key [f9] 'new-frame)
(global-set-key [f10] 'indent-region)
(global-set-key [f11] 'goto-line)
(global-set-key [f12] 'what-line)

;(require 'func-menu)
;(add-hook 'find-file-hooks 'fume-add-menubar-entry)
;(define-key global-map '(control button3) 'mouse-function-menu)

(setq fume-max-items 25
      fume-fn-window-position 3
      fume-auto-position-popup t
      fume-display-in-modeline-p t
      fume-buffer-name "*Function List*"
      fume-no-prompt-on-valid-default nil
      fume-function-name-regexp-perl "^sub[ \t]+\\([A-Za-z0-9_:']+\\)")

;;(global-set-key '(control button3) 'imenu)
;;(setq imenu-sort-function nil)
;; get the marks to hilite
;(set-face-background 'region "dark gray")
;;(transient-mark-mode 1)
(auto-fill-mode 1)

;;(setq user-full-name "Larry Lipsmeyer")
;;(setq user-mail-address "llipsmeyer@imask.com")
;;(setq smtpmail-default-smtp-server "localhost")
;;(setq smtpmail-local-domain "imask.com")
;;(setq send-mail-function 'smtpmail-send-it)
;;(load-library "smtpmail")

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-hook 'c-mode-hook 'turn-on-font-lock)
(add-hook 'c++-mode-hook 'turn-on-font-lock)
(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'dired-mode-hook 'turn-on-font-lock)
;;(add-hook 'perl-mode-hook 'turn-on-font-lock)
(add-hook 'java-mode-hook 'turn-on-font-lock)
(add-hook 'python-mode-hook 'turn-on-font-lock)

;;; PERL mode
;invoke perl-mode automatically on .pl files:
(setq auto-mode-alist  (cons '("\\\\.pl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\\\.pm$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\\\.perl$" . perl-mode) auto-mode-alist))
(setq auto-mode-alist  (cons '("\\\\.cgi$" . perl-mode) auto-mode-alist))

;; Python mode stuff
(setq auto-mode-alist  (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist))


;;; CC mode customizations
(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode and related modes
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'case-label 2)
  ;;(setq tab-width 4)
  ;; other customizations can go here
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'java-mode-common-hook 'my-c-mode-common-hook)


;; Options Menu Settings
;; =====================
(cond
 ((and (string-match "XEmacs" emacs-version)
       (boundp 'emacs-major-version)
       (or (and
            (= emacs-major-version 19)
            (>= emacs-minor-version 14))
           (= emacs-major-version 20))
       (fboundp 'load-options-file))
  (load-options-file "/home/llipsmey/.xemacs-options")))
;; ============================
;; End of Options Menu Settings
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "UTF-8")
 '(debug-on-error t)
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :family "adobe-courier")))))
