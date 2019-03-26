## ----setup, include = FALSE, echo = FALSE, message = FALSE---------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(mize)

## ----Test data-----------------------------------------------------------
rb_fg <- list(
   fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
   gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                          200 *        (x[2] - x[1] * x[1])) })
rb0 <- c(-1.2, 1)

## ----termination by max_iter---------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10)
res$terminate
res$f
res$par

## ----Absolute tolerance--------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 100, abs_tol = 1e-8)
res$terminate
res$f
res$par

## ----Relative tolerance--------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 100, rel_tol = 1e-3)
# hit relative tolerance
res$terminate

# but stopped too early!
res$iter
res$f
res$par

## ----Gradient 2-norm tolerance-------------------------------------------
res <- mize(rb0, rb_fg, abs_tol = 0, grad_tol = 1e-3)

res$terminate
res$f
res$par

## ----Gradient infinity-norm tolerance------------------------------------
res <- mize(rb0, rb_fg, rel_tol = NULL, abs_tol = NULL, ginf_tol = 1e-3)

res$terminate
res$f
res$par

## ----Step tolerance------------------------------------------------------
# set abs_tol to zero to stop it from triggering instead of step_tol
res <- mize(rb0, rb_fg, abs_tol = 0, step_tol = .Machine$double.eps)
res$terminate
res$iter
res$f
res$par

## ----Maximum number of function evaluations------------------------------
res <- mize(rb0, rb_fg, max_fn = 10)

res$terminate
res$nf
res$f
res$par

## ----Maximum number of gradient evaluations------------------------------
res <- mize(rb0, rb_fg, max_gr = 10)

res$terminate
res$ng
res$f
res$par

## ----Maximum number of function and gradient evaluations-----------------
res <- mize(rb0, rb_fg, max_fg = 10)

res$terminate
res$nf
res$ng
res$f
res$par

## ----Checking convergence less often-------------------------------------
res <- mize(rb0, rb_fg, grad_tol = 1e-3, check_conv_every = 5, verbose = TRUE)

