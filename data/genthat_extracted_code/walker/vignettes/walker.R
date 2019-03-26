## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(walker)

## ----example-------------------------------------------------------------
set.seed(1)
n <- 100
beta1 <- cumsum(c(0.5, rnorm(n - 1, 0, sd = 0.05)))
beta2 <- cumsum(c(-1, rnorm(n - 1, 0, sd = 0.15)))
x1 <- rnorm(n, mean = 2)
x2 <- cos(1:n)
rw <- cumsum(rnorm(n, 0, 0.5))
ts.plot(cbind(rw, beta1 * x1, beta2 * x2), col = 1:3)

## ----observations--------------------------------------------------------
signal <- rw + beta1 * x1 + beta2 * x2
y <- rnorm(n, signal, 0.5)
ts.plot(cbind(signal, y), col = 1:2)

## ----walker--------------------------------------------------------------
fit <- walker(y ~ -1 + rw1(~ x1 + x2, beta_prior = c(0, 10), sigma_prior = c(0, 10)), 
  refresh = 0, chains = 2, sigma_y_prior = c(0, 10))

## ----pars----------------------------------------------------------------
print(fit$stanfit, pars = c("sigma_y", "sigma_rw1"))
mcmc_areas(as.matrix(fit$stanfit), regex_pars = c("sigma_y", "sigma_rw1"))

## ----plot_with_true_betas------------------------------------------------
betas <- summary(fit$stanfit, "beta_rw")$summary[, "mean"]

ts.plot(cbind(rw, beta1, beta2, matrix(betas, ncol = 3)),
  col = rep(1:3, 2), lty = rep(1:2, each = 3))

## ----plot_pretty_betas---------------------------------------------------
plot_coefs(fit)

## ----ppc-----------------------------------------------------------------
pp_check(fit)

## ----prediction----------------------------------------------------------
new_data <- data.frame(x1 = rnorm(10, mean = 2), x2 = cos((n + 1):(n + 10)))
pred <- predict(fit, new_data)
plot_predict(pred)

## ----walker_rw2----------------------------------------------------------
fit_rw2 <-walker(y ~ -1 + 
    rw2(~ x1 + x2, beta_prior = c(0, 10), sigma_prior = c(0, 10), slope_prior = c(0, 10)), 
  refresh = 0, chains = 2, sigma_y_prior = c(0, 10))
plot_coefs(fit_rw2)

## ----naive---------------------------------------------------------------
naive_walker <- walker_rw1(y ~ x1 + x2, seed = 1, refresh = 0, chains = 2,
  beta_prior = cbind(0, rep(5, 3)), sigma_prior = cbind(0, rep(2, 4)),
  naive = TRUE, control = list(adapt_delta = 0.95, max_treedepth = 15))
print(naive_walker$stanfit, pars = c("sigma_y", "sigma_b"))

## ----kalman--------------------------------------------------------------
kalman_walker <- walker_rw1(y ~ x1 + x2, seed = 1, refresh = 0, chains = 2,
  beta_prior = cbind(0, rep(5, 3)), sigma_prior = cbind(0, rep(2, 4)),
  naive = FALSE)
print(kalman_walker$stanfit, pars = c("sigma_y", "sigma_b"))


## ----times---------------------------------------------------------------
sum(get_elapsed_time(kalman_walker$stanfit))
sum(get_elapsed_time(naive_walker$stanfit))

