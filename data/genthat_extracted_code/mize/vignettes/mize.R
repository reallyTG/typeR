## ----setup, include = FALSE, echo = FALSE, message = FALSE---------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(mize)

## ----Definining a function and gradient to optimize----------------------
rb_fg <- list(
   fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
   gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                          200 *        (x[2] - x[1] * x[1])) })

## ----A function list with an optional fg item----------------------------
rb_fg <- list(
   fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
   gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                          200 *        (x[2] - x[1] * x[1])) },
   fg = function(x) {   
     a <- x[2] - x[1] * x[1]
     b <- 1 - x[1]
     list( 
       fn = 100 * a ^ 2 + b ^ 2,
       gr = c( -400 * x[1] * a - 2 * b,
                200 * a)
     )
   }
)

## ----Defining a starting point-------------------------------------------
rb0 <- c(-1.2, 1)

## ----Defaults------------------------------------------------------------
res <- mize(rb0, rb_fg)
# What were the final parameter values? (should be close to c(1, 1))
res$par

# What was the function value at that point (should be close to 0)
res$f

# How many iterations did it take?
res$iter

# How many function evaluations?
res$nf

# How many gradient evaluations?
res$ng

# Why did the optimization terminate?
res$terminate

## ----Verbose mode--------------------------------------------------------
res <- mize(rb0, rb_fg, grad_tol = 1e-3, ginf_tol = 1e-3, max_iter = 10, 
            verbose = TRUE)

## ----Log every 10 iterations---------------------------------------------
res <- mize(rb0, rb_fg, grad_tol = 1e-3, verbose = TRUE, log_every = 10)

## ----Returning stored progress-------------------------------------------
res <- mize(rb0, rb_fg, store_progress = TRUE, log_every = 10)
res$progress

## ----Steepest descent----------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "SD")

## ----BFGS----------------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "BFGS")

## ----BFGS without scaled Hessian-----------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "BFGS", scale_hess = FALSE)

## ----LBFGS---------------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "L-BFGS", memory = 7)

## ----LBFGS without scaled Hessian----------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "L-BFGS", scale_hess = FALSE)

## ----CG with PR+---------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG")

## ----CG with HZ+---------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", cg_update = "HZ+")

## ----NAG-----------------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "NAG")

## ----NAG with 100 steps--------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 100, method = "NAG", store_progress = TRUE)
plot(res$progress$nf, log(res$progress$f), type = "l")
res$f

## ----NAG with 100 steps and less aggressive momentum---------------------
resq <- mize(rb0, rb_fg, max_iter = 100, method = "NAG", nest_q = 0.001, 
            store_progress = TRUE)
plot(res$progress$nf, log(res$progress$f), type = "l",
     ylim = range(log(res$progress$f), log(resq$progress$f)))
lines(resq$progress$nf, log(resq$progress$f), col = "red")
resq$f

## ----Momentum------------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = 0.9)

## ----Momentum plot-------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9,
            store_progress = TRUE)
plot(res$progress$nf, log(res$progress$f), type = "l")
res$f

## ----momentum with a switch function-------------------------------------
# Switch from a momentum of 0.4 to 0.8 at iteration 5
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = "switch",
            mom_init = 0.4, mom_final = 0.8, mom_switch_iter = 5)

## ----momentum with a ramp function---------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = "ramp",
            mom_init = 0.4, mom_final = 0.8)

## ----momentum with nesterov schedule-------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = "nsconvex")

## ----momentum with nesterov schedule and non-zero q----------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = "nsconvex",
            nest_q = 0.001)

## ----momentum with random momentum---------------------------------------
mom_fn <- function(iter, max_iter) {
  runif(n = 1, min = 0, max = 1)
}
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = mom_fn)

## ----Simplified Nesterov momentum----------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", mom_schedule = 0.9, 
            mom_type = "nesterov")

## ----Nesterov versus classical momentum----------------------------------
resc <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             store_progress = TRUE)
resn <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             mom_type = "nesterov", 
             store_progress = TRUE)
# Best f found for Nesterov momentum
resn$f
# Best f found for classical momentum
resc$f
plot(resc$progress$nf, log(resc$progress$f), type = "l",
     ylim = range(log(resc$progress$f), log(resn$progress$f)))
lines(resn$progress$nf, log(resn$progress$f), col = "red")

## ----Nesterov momentum with convex approximation-------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "MOM", 
            mom_schedule = "nsconvex", nest_convex_approx = TRUE, 
            mom_type = "nesterov")

## ----other Wolfe line search---------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "Rasmussen")
# Use Mark Schmidt's minFunc line search 
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "Schmidt")
# Hager-Zhang line search  
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "Hager-Zhang")
# Hager-Zhang can be abbreviated to "HZ"
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "HZ")
# You can explicitly set More-Thuente too
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "More-Thuente")
# More-Thuente can be abbreviated to "MT"
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "MT")

## ----Line search parameters----------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", cg_update = "HZ+", 
            c2 = 0.5, c1 = 0.1)

## ----Line search with slope ratio----------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, step_next_init = "slope")

## ----Line search with Hager-Zhang QuadStep-------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, step_next_init = "hz", 
            line_search = "mt")

## ----Line search with scipy initialization-------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, step0 = "scipy")

## ----Line search with initial step length of 1---------------------------
# An initial guess of 1 for the step length isn't bad for L-BFGS
res <- mize(rb0, rb_fg, max_iter = 10, step0 = 1, method = "L-BFGS")

## ----BFGS with no Newton step--------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "BFGS", try_newton_step = FALSE)

## ----alternative Wolfe conditions----------------------------------------
# Rasmussen line search with standard Wolfe conditions
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "Rasmussen",
            strong_curvature = FALSE)
# Hager-Zhang with strong Wolfe conditions
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "HZ",
            strong_curvature = TRUE, approx_armijo = FALSE)
# More-Thuente with approx Armijo conditions
res <- mize(rb0, rb_fg, max_iter = 10, method = "CG", line_search = "MT",
            approx_armijo = TRUE)

## ----constant step size--------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "SD", line_search = "constant",
            norm_direction = TRUE, step0 = 0.01)

## ----backtracking with cubic interpolation-------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, line_search = "backtracking", step0 = 1, 
            c1 = 0.1)

## ----backtracking with halved step size----------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, line_search = "backtracking",
            step0 = 1, c1 = 0.1, step_down = 0.5)

## ----bold driver---------------------------------------------------------
# increase step size by 10%, but reduce by 50%
res <- mize(rb0, rb_fg, max_iter = 10, line_search = "bold",
            step0 = 1, step_down = 0.5, step_up = 1.1)

## ----max line search functions-------------------------------------------
# No more than 10 gradient evaluations allowed per line search
res <- mize(rb0, rb_fg, max_iter = 10, ls_max_gr = 10)

## ------------------------------------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "DBD",
            step0 = "rasmussen", step_down = 0.5, step_up = 1.1,
            dbd_weight = 0.5)

## ----t-SNE style DBD parameters------------------------------------------
res <- mize(rb0, rb_fg, max_iter = 10, method = "DBD",
            step0 = "rasmussen", step_down = 0.8, step_up = 0.2,
            step_up_fun = "+")

## ------------------------------------------------------------------------
# DBD with rel_tol and abs_tol is explicitly set
res <- mize(rb0, rb_fg, max_iter = 10, method = "DBD",
             step0 = "rasmussen", step_down = 0.8, step_up = 0.2,
             step_up_fun = "+", rel_tol = 1e-8, abs_tol = 1e-8)
# 10 gradient calculations as expected
res$ng
# But 10 function calculations too, only used in the tolerance check
res$nf

# Turn off the rel_tol and abs_tol and let max_iter handle termination
res <- mize(rb0, rb_fg, max_iter = 10, method = "DBD",
            step0 = "rasmussen", step_down = 0.8, step_up = 0.2,
            step_up_fun = "+", rel_tol = NULL, abs_tol = NULL,
            grad_tol = 1e-5)
# 11 gradient calculations
res$ng
# Only one function evalation needed (to calculate res$f)
res$nf

## ----momentum with restart-----------------------------------------------
resc <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             store_progress = TRUE)
resf <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             store_progress = TRUE, restart = "fn")
resg <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             store_progress = TRUE, restart = "gr")
plot(resc$progress$nf, log(resc$progress$f), type = "l", 
     ylim = range(log(resc$progress$f), log(resf$progress$f),
                  log(resg$progress$f)))
lines(resf$progress$nf, log(resf$progress$f), col = "red")
lines(resg$progress$nf, log(resg$progress$f), col = "blue")

## ----momentum with restart and wait time---------------------------------
resfw <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             store_progress = TRUE, restart = "fn", restart_wait = 1)
resgw <- mize(rb0, rb_fg, max_iter = 100, method = "MOM", mom_schedule = 0.9, 
             store_progress = TRUE, restart = "gr", restart_wait = 1)
plot(resc$progress$nf, log(resc$progress$f), type = "l", 
     ylim = range(log(resc$progress$f), log(resf$progress$f),
                  log(resg$progress$f), log(resfw$progress$f),
                  log(resgw$progress$f)))
lines(resf$progress$nf, log(resf$progress$f), col = "red")
lines(resfw$progress$nf, log(resfw$progress$f), col = "blue")
lines(resgw$progress$nf, log(resgw$progress$f), col = "orange")

