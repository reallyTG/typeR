## ----setup, include = FALSE---------------------------------------------------
options(width = 80)
knitr::opts_chunk$set(collapse = TRUE, comment = "#R", error = FALSE)

## ----def_roll_funcs, echo = FALSE, message=FALSE------------------------------
#####
# Pure R version of package function
roll_regress_R <- function(X, y, width){
  n <- nrow(X)
  p <- ncol(X)
  out <- matrix(NA_real_, p, n)
  
  dummy_1 <- matrix(0.)
  dummy_2 <- numeric(p)
  dummy_3 <- numeric(p)

  is_first <- TRUE
  for(i in width:n){
    if(is_first){
      is_first <- FALSE
      qr. <- qr(X[1:width, ])
      R <- qr.R(qr.)

      # Use X^T
      X <- t(X)

      XtY <- drop(tcrossprod(y[1:width], X[, 1:width]))
    } else {
      x_new <- X[, i]
      x_old <- X[, i - width]

      # update R 
      rollRegres:::dchud_wrap(
        R, p, p, x_new, dummy_1, 0L, 0L, 0., 0., dummy_2, dummy_3)

      # downdate R
      rollRegres:::dchdd_wrap(
        R, p, p, x_old, dummy_1, 0L, 0L, 0., 0., dummy_2, dummy_3, 
        integer(1))

      # update XtY
      XtY <- XtY + y[i] * x_new - y[i - width] * x_old
    }

    coef. <- .Internal(backsolve(R, XtY, p, TRUE, TRUE))
    coef. <- .Internal(backsolve(R, coef., p, TRUE, FALSE))

    out[, i] <- coef.
  }

  t(out)
}

#####
# simple R version
roll_regress_R_for_loop <- function(X, y, width){
  n <- nrow(X)
  p <- ncol(X)
  out <- matrix(NA_real_, n, p)

  for(i in width:n){
    idx <- (i - width + 1L):i
    out[i, ] <- lm.fit(X[idx, , drop = FALSE], y[idx])$coefficients
  }

  out
}

#####
# zoo version
.zoo_inner <- function(Z) {
  fit <- lm.fit(Z[, -1, drop = FALSE], Z[, 1])
  fit$coefficients
}
library(zoo)
roll_regress_zoo <- function(x, y, width){
  Z <- cbind(y, X)
  rollapply(Z, width, FUN = .zoo_inner,  
            by.column = FALSE,  align = "right", fill = NA_real_)
}

#####
# roll_lm
library(roll)
roll_lm_func <- function(x, y ,width)
  roll_lm(X, matrix(y, ncol = 1), wdth, intercept = FALSE)$coefficients[, -1L]

# use one thread as other methods are easily to compute in parallel too
RcppParallel::setThreadOptions(numThreads = 1)

# compile functions
library(compiler)
roll_regress_R          <- cmpfun(roll_regress_R)
roll_regress_R_for_loop <- cmpfun(roll_regress_R_for_loop)
.zoo_inner              <- cmpfun(.zoo_inner)
roll_regress_zoo        <- cmpfun(roll_regress_zoo)
roll_lm_func            <- cmpfun(roll_lm_func)

## ----sim_data-----------------------------------------------------------------
set.seed(32981054)
n <- 10000
p <- 6
wdth = 50
X <- matrix(rnorm(p * n), n, p)
y <- drop(X %*% runif(p)) + rnorm(n)
df <- data.frame(y, X)
frm <- eval(parse(text = paste0(
  "formula(y ~ -1 + ", paste0("X", 1:p, collapse = " + "), ")")))

## ----roll_gives_same----------------------------------------------------------
library(rollRegres)
all.equal(roll_regress_R(X, y, wdth), roll_regres.fit(X, y, wdth)$coefs, 
          check.attributes = FALSE)
all.equal(roll_regress_R(X, y, wdth), roll_regres(frm, df, wdth)$coefs, 
          check.attributes = FALSE)
all.equal(roll_regress_R(X, y, wdth), roll_regress_zoo(X, y, wdth), 
          check.attributes = FALSE)
all.equal(roll_regress_R(X, y, wdth), roll_regress_R_for_loop(X, y, wdth), 
          check.attributes = FALSE)
all.equal(roll_regress_R(X, y, wdth), roll_lm_func(X, y, wdth), 
          check.attributes = FALSE)

## ----benchmark_roll-----------------------------------------------------------
microbenchmark::microbenchmark(
  roll_regress            = roll_regres.fit(X, y, wdth),
  # this will be slower due to call to `model.matrix` and `model.frame`
  roll_regress_df         = roll_regres(frm, df, wdth),
  roll_regress_R          = roll_regress_R(X, y, wdth),
  roll_regress_zoo        = roll_regress_zoo(X, y, wdth),
  roll_regress_R_for_loop = roll_regress_R_for_loop(X, y, wdth),
  roll_lm = roll_lm_func(X, y, wdth),
  times = 5)

# here is the formula used above
frm

## ----expanding_window---------------------------------------------------------
#####
# simulate data
set.seed(65731482)
n <- 100
p <- 2
X <- matrix(rnorm(p * n), n, p)
y <- drop(X %*% runif(p)) + rnorm(n)

#####
# use package function
pck_out <- roll_regres.fit(
  X, y, width = 50L, do_downdates = FALSE, 
  do_compute = c("sigmas", "r.squareds", "1_step_forecasts"))

#####
# assign R-version
R_func <- function(X, y, width){
  n <- nrow(X)
  p <- ncol(X)
  out <- matrix(NA_real_, n, p)
  sigmas             <- rep(NA_real_, n)
  r.squared          <- rep(NA_real_, n)
  one_step_forecasts <- rep(NA_real_, n)

  for(i in width:n){
    idx <- 1:i
    fit <- lm(y[idx] ~ -1 + X[idx, , drop = FALSE])
    out[i, ] <- fit$coefficients

    su <- summary(fit)
    sigmas[i] <- su$sigma

    ss1 <- sum((y[idx] - mean(y[idx]))^2)
    ss2 <- sum(fit$residuals^2)
    r.squared[i] <- 1 - ss2 / ss1

    if(i < n){
      next_i <- i + 1L
      one_step_forecasts[next_i] <- fit$coefficients %*% X[next_i, ]
    }
  }

  list(coef = out, sigmas = sigmas, r.squared = r.squared,
       one_step_forecasts = one_step_forecasts)
}

R_out <- R_func(X, y, 50L)

#####
# gives the same
stopifnot(isTRUE(all.equal(R_out$coef              , pck_out$coefs)))
stopifnot(isTRUE(all.equal(R_out$sigmas            , pck_out$sigmas)))
stopifnot(isTRUE(all.equal(R_out$r.squared         , pck_out$r.squared)))
stopifnot(isTRUE(all.equal(R_out$one_step_forecasts, pck_out$one_step_forecasts)))

## ----block_example------------------------------------------------------------
#####
# simulate data
set.seed(68799379)
week <- as.integer(gl(25, 7))
head(week[1:10])
n <- length(week)
p <- 2
X <- matrix(rnorm(p * n), n, p)
y <- drop(X %*% runif(p)) + rnorm(n)

#####
# use package function
pck_out <- roll_regres.fit(
  X, y, width = 10L, grp = week, 
  do_compute = c("sigmas", "r.squareds", "1_step_forecasts"))

#####
# assign R-version
R_func <- function(X, y, width, grp){
  grp <- grp + 1L - min(grp)
  u_grp = unique(grp)
  n <- nrow(X)
  p <- ncol(X)
  out <- matrix(NA_real_, n, p)
  sigmas             <- rep(NA_real_, n)
  r.squared          <- rep(NA_real_, n)
  one_step_forecasts <- rep(NA_real_, n)

  start_val <- min(which(u_grp >= width))
  for(g in u_grp[start_val:length(u_grp)]){
    idx <- which(grp %in% (g - width + 1L):g)
    i <- which(grp == g)
    fit <- lm(y[idx] ~ -1 + X[idx, , drop = FALSE])
    out[i, ] <- sapply(fit$coefficients, rep, times = length(i))

    su <- summary(fit)
    sigmas[i] <- su$sigma

    ss1 <- sum((y[idx] - mean(y[idx]))^2)
    ss2 <- sum(fit$residuals^2)
    r.squared[i] <- 1 - ss2 / ss1

    if(g != max(grp)){
      next_g <- grp[min(which(grp > g))]
      next_g <- which(grp == next_g)
      one_step_forecasts[next_g] <- X[next_g, ] %*% fit$coefficients
    }
  }

  list(coef = out, sigmas = sigmas, r.squared = r.squared,
       one_step_forecasts = one_step_forecasts)
}

R_out <- R_func(X, y, 10L, grp = week)

#####
# gives the same
stopifnot(isTRUE(all.equal(R_out$coef              , pck_out$coefs)))
stopifnot(isTRUE(all.equal(R_out$sigmas            , pck_out$sigmas)))
stopifnot(isTRUE(all.equal(R_out$r.squared         , pck_out$r.squared)))
stopifnot(isTRUE(all.equal(R_out$one_step_forecasts, pck_out$one_step_forecasts)))

## ----min_obs------------------------------------------------------------------
#####
# simulate data
set.seed(96235555)
n   <- 10L * 12L * 21L # x years w/ 12 months of 21 trading days
month <- (seq_len(n) - 1L) %/% 21L + 1L # group by months
set.seed(29478439)
X <- matrix(rnorm(n * 4L), ncol = 4L)
y <- rnorm(n)

# randomly drop rows
keep <- seq_along(y) %in% sample.int(nrow(X), as.integer(n * .5))
X     <- X    [keep, ]
y     <- y    [keep]
month <- month[keep]

#####
# use package function
pck_out <- roll_regres.fit(
  X, y, width = 12L, grp = month, min_obs = 21L * 6L, do_downdates = TRUE, 
  do_compute = c("sigmas", "r.squareds"))

#####
# assign R-version
R_func <- function(X, y, width, grp, downdate, min_obs){
  grp <- grp + 1L - min(grp)
  u_grp = unique(grp)
  n <- nrow(X)
  p <- ncol(X)
  out <- matrix(NA_real_, n, p)
  sigmas    <- rep(NA_real_, n)
  r.squared <- rep(NA_real_, n)

  start_val <- min(which(u_grp >= width))
  for(g in u_grp[start_val:length(u_grp)]){
    idx <-
      if(downdate)
        which(grp %in% (g - width + 1L):g) else
          which(grp %in% 1:g)
    i <- which(grp == g)
    if(length(idx) < min_obs)
      next
    fit <- lm(y[idx] ~ -1 + X[idx, , drop = FALSE])
    out[i, ] <- sapply(fit$coefficients, rep, times = length(i))

    su <- summary(fit)
    sigmas[i] <- su$sigma

    ss1 <- sum((y[idx] - mean(y[idx]))^2)
    ss2 <- sum(fit$residuals^2)
    r.squared[i] <- 1 - ss2 / ss1
  }

  list(coef = out, sigmas = sigmas, r.squared = r.squared)
}

R_out <- R_func(X, y, width = 12L, downdate = TRUE, grp = month, 
                min_obs = 21L * 6L)

#####
# gives the same
stopifnot(isTRUE(all.equal(R_out$coef     , pck_out$coefs)))
stopifnot(isTRUE(all.equal(R_out$sigmas   , pck_out$sigmas)))
stopifnot(isTRUE(all.equal(R_out$r.squared, pck_out$r.squared)))

## ----ses_info-----------------------------------------------------------------
sessionInfo()

## ----def_roll_funcs, eval = FALSE---------------------------------------------
#  #####
#  # Pure R version of package function
#  roll_regress_R <- function(X, y, width){
#    n <- nrow(X)
#    p <- ncol(X)
#    out <- matrix(NA_real_, p, n)
#  
#    dummy_1 <- matrix(0.)
#    dummy_2 <- numeric(p)
#    dummy_3 <- numeric(p)
#  
#    is_first <- TRUE
#    for(i in width:n){
#      if(is_first){
#        is_first <- FALSE
#        qr. <- qr(X[1:width, ])
#        R <- qr.R(qr.)
#  
#        # Use X^T
#        X <- t(X)
#  
#        XtY <- drop(tcrossprod(y[1:width], X[, 1:width]))
#      } else {
#        x_new <- X[, i]
#        x_old <- X[, i - width]
#  
#        # update R
#        rollRegres:::dchud_wrap(
#          R, p, p, x_new, dummy_1, 0L, 0L, 0., 0., dummy_2, dummy_3)
#  
#        # downdate R
#        rollRegres:::dchdd_wrap(
#          R, p, p, x_old, dummy_1, 0L, 0L, 0., 0., dummy_2, dummy_3,
#          integer(1))
#  
#        # update XtY
#        XtY <- XtY + y[i] * x_new - y[i - width] * x_old
#      }
#  
#      coef. <- .Internal(backsolve(R, XtY, p, TRUE, TRUE))
#      coef. <- .Internal(backsolve(R, coef., p, TRUE, FALSE))
#  
#      out[, i] <- coef.
#    }
#  
#    t(out)
#  }
#  
#  #####
#  # simple R version
#  roll_regress_R_for_loop <- function(X, y, width){
#    n <- nrow(X)
#    p <- ncol(X)
#    out <- matrix(NA_real_, n, p)
#  
#    for(i in width:n){
#      idx <- (i - width + 1L):i
#      out[i, ] <- lm.fit(X[idx, , drop = FALSE], y[idx])$coefficients
#    }
#  
#    out
#  }
#  
#  #####
#  # zoo version
#  .zoo_inner <- function(Z) {
#    fit <- lm.fit(Z[, -1, drop = FALSE], Z[, 1])
#    fit$coefficients
#  }
#  library(zoo)
#  roll_regress_zoo <- function(x, y, width){
#    Z <- cbind(y, X)
#    rollapply(Z, width, FUN = .zoo_inner,
#              by.column = FALSE,  align = "right", fill = NA_real_)
#  }
#  
#  #####
#  # roll_lm
#  library(roll)
#  roll_lm_func <- function(x, y ,width)
#    roll_lm(X, matrix(y, ncol = 1), wdth, intercept = FALSE)$coefficients[, -1L]
#  
#  # use one thread as other methods are easily to compute in parallel too
#  RcppParallel::setThreadOptions(numThreads = 1)
#  
#  # compile functions
#  library(compiler)
#  roll_regress_R          <- cmpfun(roll_regress_R)
#  roll_regress_R_for_loop <- cmpfun(roll_regress_R_for_loop)
#  .zoo_inner              <- cmpfun(.zoo_inner)
#  roll_regress_zoo        <- cmpfun(roll_regress_zoo)
#  roll_lm_func            <- cmpfun(roll_lm_func)

