;;; init-evil.el --- evil config
;;; Commentary:
;;; Code:

(global-evil-leader-mode)
(evil-leader/set-leader ",")

(require 'evil)

(evil-mode 1)

(setq evil-emacs-state-cursor '("red" box)
     evil-normal-state-cursor '("green" box)
    evil-visual-state-cursor '("orange" box)
    evil-insert-state-cursor '("red" bar)
    evil-replace-state-cursor '("red" (hbar . 2))
    evil-operator-state-cursor '("red" hollow))

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(define-key evil-normal-state-map (kbd "C-k") (lambda ()
                                                (interactive)
                                                (evil-scroll-up nil)))
(define-key evil-normal-state-map (kbd "C-j") (lambda ()
                                                (interactive)
                                                (evil-scroll-down nil)))

;; window move
(define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
(define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)

;; elscreen kill
;; (define-key evil-normal-state-map (kbd "C-w d") 'elscreen-kill)

;; c+ c- to increase/decrease number like Vim's C-a C-x
(define-key evil-normal-state-map (kbd "C-+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)

(require 'evil-surround)
(global-evil-surround-mode 1)
(defun evil-surround-prog-mode-hook-setup ()
  "编程模式使用."
  (push '(47 . ("/" . "/")) evil-surround-pairs-alist)
  (push '(40 . ("(" . ")")) evil-surround-pairs-alist)
  (push '(41 . ("(" . ")")) evil-surround-pairs-alist)
  (push '(91 . ("[" . "]")) evil-surround-pairs-alist)
  (push '(93 . ("[" . "]")) evil-surround-pairs-alist))
(add-hook 'prog-mode-hook 'evil-surround-prog-mode-hook-setup)
(defun evil-surround-emacs-lisp-mode-hook-setup ()
  "Emacs-lisp-mode使用."
  (push '(?` . ("`" . "'")) evil-surround-pairs-alist))
(add-hook 'emacs-lisp-mode-hook 'evil-surround-emacs-lisp-mode-hook-setup)

(evilnc-default-hotkeys t)
;; Emacs key bindings
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)
;; Vim key bindings
(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/in-all-states 1)
(evil-leader/set-key
  ;; comment
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line
  "."  'evilnc-copy-and-comment-operator
  "\\" 'evilnc-comment-operator ; if you prefer backslash key
  "v"  'exchange-point-and-mark
  ;; other
  "ff" 'counsel-find-file
  "fr" 'recentf-open-files
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
  "sm" 'counsel-imenu
  "fg" 'counsel-git
  "bf" 'beginning-of-defun
  "ef" 'end-of-defun
)

(evil-leader/set-key "o" (lambda () ; <leader>o open line below
                           (interactive)
                           (evil-open-below 1)
                           (evil-normal-state)))
(evil-leader/set-key "O" (lambda () ; <leader>o open line above
                           (interactive)
                           (evil-open-above 1)
                           (evil-normal-state)))

(provide 'init-evil)
;;; init-evil.el ends here
