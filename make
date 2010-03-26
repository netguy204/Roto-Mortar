#!/usr/bin/sbcl --script

#+sbcl
(declaim (sb-ext:muffle-conditions t))

(require 'asdf)

(dolist (package '(:alexandria
                   :babel
                   :cffi
		   :cl-opengl
		   :png
		   :closure-common
		   :cxml
		   :puri
		   :trivial-features
		   :trivial-gray-streams
		   :zpb-ttf))
  (asdf:oos 'asdf:load-op package))

(with-output-to-string (*error-output-not*)
  (with-output-to-string (*standard-output-not*)
    (asdf:operate 'asdf:load-op :roto-mortar :verbose nil)))

(in-package :roto-mortar)
(save-and-die)
