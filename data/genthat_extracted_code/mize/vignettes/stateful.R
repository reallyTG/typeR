## ----setup, include = FALSE, echo = FALSE, message = FALSE---------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(mize)

## ----optim example-------------------------------------------------------
rb_fg <- list(
   fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
   gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                          200 *        (x[2] - x[1] * x[1])) })
rb0 <- c(-1.2, 1)

par <- rb0
for (batch in 1:3) {
  optim_res <- stats::optim(par = par, fn = rb_fg$fn, gr = rb_fg$gr, 
                            method = "BFGS", control = list(maxit = 10))
  par <- optim_res$par
  message("batch ", batch, " f = ", formatC(optim_res$value))
}

## ----Creating an optimizer-----------------------------------------------
opt <- make_mize(method = "BFGS")

## ----Initializing an optimizer-------------------------------------------
opt <- mize_init(opt = opt, par = rb0, fg = rb_fg)

## ----Creating and initializing an optimizer------------------------------
opt <- make_mize(method = "BFGS", par = rb0, fg = rb_fg, max_iter = 30)

## ----Optimization--------------------------------------------------------
par <- rb0
iter <- 0
for (batch in 1:3) {
  for (i in 1:10) {
    mize_res <- mize_step(opt = opt, par = par, fg = rb_fg)
    par <- mize_res$par
    opt <- mize_res$opt
  }
  message("batch ", batch, " f = ", formatC(mize_res$f))
}

## ----Full example--------------------------------------------------------
# Create the optimizer
opt <- make_mize(method = "BFGS")

# Pretend we don't have access to the function or starting point until later
rb_fg <- list(
   fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
   gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                          200 *        (x[2] - x[1] * x[1])) })
rb0 <- c(-1.2, 1)

# Initialize
opt <- mize_init(opt = opt, par = rb0, fg = rb_fg)

# Store the best seen parameters in case something goes wrong
par <- rb0
par_best <- par
f_best <- rb_fg$fn(par_best)

for (i in 1:30) {
  mize_res <- mize_step(opt = opt, par = par, fg = rb_fg)
  par <- mize_res$par
  opt <- mize_res$opt
  
  # Do whatever you want with the data at each iteration
  
  if (opt$is_terminated) {
    # Something bad happened
    break
  }
  if (mize_res$f < f_best) {
    f_best <- mize_res$f
    par_best <- par
  }
}

# optimized result is in par_best
par_best
f_best

## ----mize_step_summary---------------------------------------------------
# Create optimizer and do one step of optimization as usual
opt <- make_mize(method = "BFGS", par = rb0, fg = rb_fg)
par <- rb0
mize_res <- mize_step(opt = opt, par = par, fg = rb_fg)
step_info <- mize_step_summary(mize_res$opt, mize_res$par, rb_fg, par_old = par)

# info that's already available in mize_res
step_info$f
step_info$ng
step_info$nf
# and some extra
step_info$step
step_info$alpha

## ----Example with step summary info--------------------------------------
# Create the optimizer
opt <- make_mize(method = "BFGS", par = rb0, fg = rb_fg)

par <- rb0
for (i in 1:10) {
  par_old <- par
  mize_res <- mize_step(opt = opt, par = par, fg = rb_fg)
  par <- mize_res$par
  opt <- mize_res$opt

  # step info
  step_info <- mize_step_summary(opt, par, rb_fg, par_old)
  opt <- step_info$opt
  message(paste(
    Map(function(x) { paste0(x, " = ", formatC(step_info[[x]])) }, 
        c("iter", "f", "nf", "ng", "step")), 
    collapse = ", "))
}

## ----Optimizers with convergence info------------------------------------
opt <- make_mize(method = "BFGS", par = rb0, fg = rb_fg, max_iter = 30)
# or
opt <- make_mize(method = "BFGS")
opt <- mize_init(opt = opt, par = rb0, fg = rb_fg, max_iter = 30)

## ----Checking for convergence--------------------------------------------
step_info <- mize_step_summary(opt, par, rb_fg, par_old)
opt <- check_mize_convergence(step_info)

## ----Full example with convergence checking------------------------------
# Create the optimizer
opt <- make_mize(method = "BFGS")

rb_fg <- list(
   fn = function(x) { 100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2  },
   gr = function(x) { c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
                          200 *        (x[2] - x[1] * x[1])) })
rb0 <- c(-1.2, 1)

# Initialize and set convergence criteria
opt <- mize_init(opt = opt, par = rb0, fg = rb_fg, max_iter = 30)

# Store the best seen parameters in case something goes wrong
par <- rb0
par_best <- par
f_best <- rb_fg$fn(par_best)

while (!opt$is_terminated) {
  mize_res <- mize_step(opt = opt, par = par, fg = rb_fg)
  par <- mize_res$par
  opt <- mize_res$opt
  
  # Do whatever you want with the data at each iteration
  
  if (opt$is_terminated) {
    # Something bad happened
    break
  }
  if (mize_res$f < f_best) {
    f_best <- mize_res$f
    par_best <- par
  }
  
  step_info <- mize_step_summary(opt, par, rb_fg, par_old)
  # Do something with the step info if you'd like
  # Check convergence
  opt <- check_mize_convergence(step_info)
}

# optimized result is in par_best
par_best
f_best

