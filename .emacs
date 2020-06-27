(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(display-time-mode t)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(truncate-partial-width-windows nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load "info")
(load "msb")

;; ;; by liangwang
;; (add-hook 'org-mode-hook(lambda() (setq truncate-lines nil)))

(set-default-font "-unknown-DejaVu Sans Mono-normal-normal-normal-*-20-*-*-*-m-0-iso10646-1")
(global-set-key "\C-z" 'undo)
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-s" 'save-buffer)
(global-set-key "\C-p" 'pwd)

(global-set-key [f2] 'shell)
(global-set-key [C-f2] 'rename-buffer)
(define-key global-map [f3] 'isearch-forward)
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key global-map [C-f3] 'isearch-backward)
(define-key isearch-mode-map [C-f3] 'isearch-repeat-backward)
(global-set-key [C-f4] 'kill-this-buffer)
(global-set-key [f5] 'goto-line)
(global-set-key [f6] 'other-window)
(global-set-key [C-f6] 'switch-to-buffer)
(global-set-key [S-f6] 'buffer-menu)
(global-set-key [f7] 'comint-previous-matching-input-from-input)
(global-set-key [S-f7] 'comint-next-matching-input-from-input)
(global-set-key [f9] 'query-replace)
(global-set-key [C-f9] 'query-replace-regexp)
(global-set-key [S-f9] 'query-replace-reg-t)
(global-set-key [f10] 'delete-window)
(global-set-key [f11] 'split-window-vertically)
(global-set-key [f12] 'split-window-horizontally)
(global-set-key [mouse-3] 'mouse-buffer-menu)

(menu-bar-mode -1)
(tool-bar-mode -1)
(global-font-lock-mode t)
(setq make-backup-files nil)
(setq display-time-24hr-format t)
(setq display-time-day-and-data nil)
(display-time)

(set-foreground-color "white")
(set-background-color "Gray22")
(set-mouse-color "yellow")
(set-cursor-color "red")
(set-face-foreground 'font-lock-comment-face "OrangeRead")

(add-to-list 'load-path "~/.emacs.d/plugins")
;;-----------------------------
;;nxml mode
;;-----------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/mylisp/nxml-mode-20041004/rng-auto.el")
(setq auto-mode-alist
      (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
	    auto-mode-alist))
(unify-8859-on-decoding-mode)

;;-----------------------------
;;Auto complete
;;-----------------------------
;; by liangwang 20200329 for remove github
;;==配置auto-complete。内容较多单独放一个目录。==============
(add-to-list 'load-path "~/.emacs.d/plugins/mylisp/auto-complete-liangwang")
;;cl-lib.el在v24中才出现，v23是没有的，要单独下载。
(require 'auto-complete)
(require 'auto-complete-config)


;; 开启全局设定(包含哪些模式在ac-modes里查看)
;;(global-auto-complete-mode t)
;;添加web-mode模式，在该模式下会自动开启自动完成
;;http://stackoverflow.com/questions/8095715/emacs-auto-complete-mode-at-startup
(add-to-list 'ac-modes 'web-mode)

;;使用自带字典
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/mylisp/auto-complete-liangwang/dict")
(ac-config-default)

;; 输入3个字符才开始补全
(setq ac-auto-start 3)

;; 补全的快捷键，用于需要提前补全-当还没有输入指定个数字符时显示弹出菜单。
(global-set-key "\M-/" 'auto-complete)  

;;使用增强的popup列表
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)

;;使用quick-help
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 0.5)

;; Show 0.8 second later
(setq ac-auto-show-menu 0.8)

;; 设置tab键的使用模式--??
;;(setq ac-dwim t)

;;使用fuzzy功能
(setq ac-fuzzy-enable t)

;;菜单
(setq ac-menu-height 12)
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue")  
;;==end auto-complete===============================

;; =============================================auto-complete begin
;; ;; (add-to-list 'load-path "~/.emacs.d/plugins/mylisp/auto-complete")
;; ;; (require 'auto-complete-config)
;; ;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/mylisp/auto-complete/ac-dict")
;; ;; (ac-config-default)
;; (add-to-list 'load-path "~/.emacs.d/plugins/mylisp/auto-complete-clang-master")
;; (require 'auto-complete-clang)  
;; ;;(setq ac-clang-auto-save t)  
;; (setq ac-auto-start t)  
;; (setq ac-quick-help-delay 0.2)  
;; ;; (ac-set-trigger-key "TAB")  
;; ;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
;; (defun my-ac-config ()  
;; ;;  (setq ac-clang-flags  
;; ;;        (mapcar(lambda (item)(concat "-I" item))  
;; ;;               (split-string  
;; ;;                "  
;; ;; /usr/include/c++/4.4  
;; ;; /usr/include/c++/4.4/i486-linux-gnu  
;; ;; /usr/include/c++/4.4/backward  
;; ;; /usr/local/include  
;; ;; /usr/lib/gcc/i486-linux-gnu/4.4.5/include  
;; ;; /usr/lib/gcc/i486-linux-gnu/4.4.5/include-fixed  
;; ;; /usr/include/i486-linux-gnu  
;; ;; /usr/include  
;; ;;")))  
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
;;   ;; (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)  
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
;;   (global-auto-complete-mode t))  
;; (defun my-ac-cc-mode-setup ()  
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
;; (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ;; ac-source-gtags  
;; (my-ac-config)  
;; (setq ac-fuzzy-enable t)
;; ========================================auto-complete end 


;; (require 'color-theme)
;; (color-theme-gnome)

;;;Color Theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;; (color-theme-gnome2) 
;; (color-theme-oswald)
;; (color-theme-comidia)
(color-theme-subtle-hacker)
