## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----nhtemp--------------------------------------------------------------
library("bssm")
data("nhtemp", package = "datasets")
prior <- halfnormal(1, 10)
bsm_model <- bsm(y = nhtemp, sd_y = prior, sd_level = prior,
sd_slope = prior)

## ----nhtemp_cpp----------------------------------------------------------
Rcpp::sourceCpp("lgg_ssm_template.cpp", rebuild = TRUE, cleanupCacheDir = TRUE)
pntrs <- create_xptrs()
bsm_model2 <- lgg_ssm(y = nhtemp, Z = pntrs$Z, H = pntrs$H, T = pntrs$T, R = pntrs$R, 
a1 = pntrs$a1, P1 = pntrs$P1, state_intercept = pntrs$C, obs_intercept = pntrs$D, 
log_prior_pdf = pntrs$log_prior_pdf, theta = rep(1, 3),
n_states = 2, state_names = c("level", "slope"), time_varying = rep(FALSE, 6))

## ----nhtemp_loglik-------------------------------------------------------
logLik(bsm_model)
logLik(bsm_model2)

## ------------------------------------------------------------------------
set.seed(1)
suppressMessages(library("sde"))
x <- sde.sim(t0 = 0, T = 100, X0 = 1, N = 100,
  drift = expression(0.5 * (2 - x)),
  sigma = expression(1),
  sigma.x = expression(0))
y <- rpois(100, exp(x[-1]))

## ------------------------------------------------------------------------
Rcpp::sourceCpp("sde_ssm_template.cpp", rebuild = TRUE,  
  cleanupCacheDir = TRUE)
pntrs <- create_xptrs()
sde_model <- sde_ssm(y, pntrs$drift, pntrs$diffusion, 
  pntrs$ddiffusion, pntrs$obs_density, pntrs$prior, c(0.5, 2, 1), 1, FALSE)

## ----mcmc_bsm------------------------------------------------------------
prior <- halfnormal(0.1, 1)
UKgas_model <- bsm(log10(UKgas), sd_y = prior, sd_level = prior,
  sd_slope = prior, sd_seasonal =  prior)

mcmc_bsm <- run_mcmc(UKgas_model, n_iter = 4e4)
mcmc_bsm

## ----plot----------------------------------------------------------------
theta <- expand_sample(mcmc_bsm, "theta")
suppressMessages(library("bayesplot"))
mcmc_areas(theta, bw = 0.001)
level <- expand_sample(mcmc_bsm, "alpha",  times = 101:109, states = 1)
mcmc_areas(level, bw = 0.005)

## ----trend, dev.args=list(pointsize = 10), fig.cap="Smoothed trend component with 95% intervals."----
sumr <- summary(mcmc_bsm)
level <- sumr$states$Mean[, 1]
lwr <- level - 1.96 * sumr$states$SD[, 1]
upr <- level + 1.96 * sumr$states$SD[, 1]
ts.plot(UKgas_model$y, cbind(level, lwr, upr), col = c(1, 2, 2, 2), lty = c(1, 1, 2, 2))

## ----predict, dev.args=list(pointsize = 10), fig.cap="Mean predictions and prediction intervals."----
future_model <- UKgas_model
future_model$y <- ts(rep(NA, 24), start = end(UKgas_model$y) + c(0, 1), frequency = 4)
pred <- predict(mcmc_bsm, future_model, probs = c(0.025, 0.1, 0.9, 0.975))
ts.plot(log10(UKgas), pred$mean, pred$intervals[, -3],
  col = c(1, 2, c(3, 4, 4, 3)), lty = c(1, 1, rep(2, 4)))

## ----predict2, dev.args=list(pointsize = 10), fig.cap="Prediction plots with ggplot2."----
require("ggplot2")
level_fit <- ts(colMeans(expand_sample(mcmc_bsm, "alpha")$level), start = start(UKgas_model$y),
  frequency = 4)
autoplot(pred, y = UKgas_model$y, fit = level_fit, interval_color = "red", alpha_fill = 0.2)

## ----predict3, dev.args=list(pointsize = 10), fig.cap="State prediction."----
pred_state <- predict(mcmc_bsm, future_model, probs = c(0.025, 0.1, 0.9, 0.975), type = "state")
ts.plot(log10(UKgas), level_fit, pred_state$mean[,"level"], pred_state$intervals$level[, -3],
  col = c(1, 2, 2, c(3, 4, 4, 3)), lty = c(1, 1, 1, rep(2, 4)))

## ----simulation----------------------------------------------------------
set.seed(1)
n <- 250

slope <- cumsum(c(0, rnorm(n - 1, sd = 0.001)))
level <- cumsum(slope + c(0, rnorm(n - 1, sd = 0.2)))
y <- rpois(n, exp(level))
ts.plot(y)

## ----ng_bsm--------------------------------------------------------------
poisson_model <- ng_bsm(y, sd_level = halfnormal(0.01, 1), sd_slope = halfnormal(0.01, 0.1), 
  P1 = diag(c(10, 0.1)), distribution = "poisson")

## ----bssm, eval = FALSE--------------------------------------------------
#  mcmc_is <- run_mcmc(poisson_model, n_iter = 1.1e5, n_burnin = 1e4, nsim_states = 10, method = "is2")

## ----stan, eval = FALSE--------------------------------------------------
#  library("rstan")
#  
#  stan_data <- list(n = n, y = y, a1 = c(0, 0), sqrtP1 = sqrt(c(10, 0.1)),
#    sd_prior_means = rep(0, 2), sd_prior_sds = c(1, 0.1))
#  stan_inits <- list(list(theta = c(0.01, 0.01),
#    slope_std = rep(0, n), level_std = log(y + 0.1)))
#  
#  mcmc_stan <- stan("stan_model.stan",
#    control = list(adapt_delta = 0.99, max_treedepth = 15),
#    data = stan_data, iter = 5000,
#    chains = 1, cores = 1, init = stan_inits)

## ----results, eval = FALSE-----------------------------------------------
#  sum(get_elapsed_time(mcmc_stan))
#  mcmc_is$time[3]
#  
#  summary(mcmc_stan, pars = "theta")$summary
#  summary_is <- summary(mcmc_is, return_se = TRUE)
#  summary_is$theta
#  
#  rbind(summary(mcmc_stan, pars = "level[1]")$summary,
#    summary(mcmc_stan, pars = "slope[1]")$summary)[, c(1,3,2)]
#  cbind(Mean = summary_is$states$Mean[1, ], SD = summary_is$states$SD[1, ],
#    SE = summary_is$states$SE[1, ])
#  rbind(summary(mcmc_stan, pars = "level[250]")$summary,
#    summary(mcmc_stan, pars = "slope[250]")$summary)[, c(1,3,2)]
#  cbind(Mean = summary_is$states$Mean[n, ], SD = summary_is$states$SD[n, ],
#    SE = summary_is$states$SE[n, ])
#  

