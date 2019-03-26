## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----data----------------------------------------------------------------
set.seed(1)

#parameters
K <- 100 # carrying capacity
p0 <- 10 # population size at t = 0
r <- .2 # growth rate

#sample time
dT <- .1

#observation times
t <- seq(0.1, 25, dT)

# simulate true population size (=p) at the observation times
p <- K * p0 * exp(r * t) / (K + p0 * (exp(r * t) - 1))

# observations
y <- ts(p + rnorm(length(t), 0, 5))


## ----pointers------------------------------------------------------------
Rcpp::sourceCpp("nlg_ssm_template.cpp")
pntrs <- create_xptrs()

## ----theta---------------------------------------------------------------
initial_theta <- c(3, 0.5, 0.5)

# dT, K, a1 and the prior variances
psi <- c(dT, 100, 0.3, 5, 4, 10)

## ----test----------------------------------------------------------------
T_fn(0, c(100, 200), initial_theta, psi, matrix(1))

## ----model---------------------------------------------------------------
library("bssm")
model <- nlg_ssm(y = y, a1=pntrs$a1, P1 = pntrs$P1, 
  Z = pntrs$Z_fn, H = pntrs$H_fn, T = pntrs$T_fn, R = pntrs$R_fn, 
  Z_gn = pntrs$Z_gn, T_gn = pntrs$T_gn,
  theta = initial_theta, log_prior_pdf = pntrs$log_prior_pdf,
  known_params = psi, known_tv_params = matrix(1),
  n_states = 2, n_etas = 2)

## ----ekf-----------------------------------------------------------------
out_filter <- ekf(model)
out_smoother <- ekf_smoother(model)
ts.plot(cbind(y, out_filter$att[, 2], out_smoother$alphahat[, 2]), col = 1:3)
ts.plot(cbind(out_filter$att[, 1], out_smoother$alphahat[, 1]), col = 1:2)

## ----mcmc----------------------------------------------------------------
out_mcmc_pm <- run_mcmc(model, n_iter = 5000, nsim_states = 10, method = "da", 
  simulation_method = "psi")
out_mcmc_ekf <- run_mcmc(model, n_iter = 5000, method = "ekf")
summary_pm <- summary(out_mcmc_pm)
summary_ekf <- summary(out_mcmc_ekf)
ts.plot(cbind(summary_pm$states$Mean[, 1], summary_ekf$states$Mean[, 1]), col = 1:3)
ts.plot(cbind(y, summary_pm$states$Mean[, 2], summary_ekf$states$Mean[, 2]), col = 1:3)

## ----pred----------------------------------------------------------------
future_model <- model
future_model$y <- ts(rep(NA, 100), start = end(model$y) + c(1, 0))
out_pred_pm <- predict(out_mcmc_pm, future_model, type = "response", nsim = 50)
out_pred_ekf <- predict(out_mcmc_ekf, future_model, type = "response", nsim = 0)
library("ggplot2")
autoplot(out_pred_pm, y = model$y, plot_median = FALSE)
autoplot(out_pred_ekf, y = model$y, plot_median = FALSE)

