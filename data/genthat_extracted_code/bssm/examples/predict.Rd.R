library(bssm)


### Name: predict.mcmc_output
### Title: Predictions for State Space Models
### Aliases: predict.mcmc_output

### ** Examples

require("graphics")
y <- log10(JohnsonJohnson)
prior <- uniform(0.01, 0, 1)
model <- bsm(window(y, end = c(1974, 4)), sd_y = prior, sd_level = prior,
  sd_slope = prior, sd_seasonal = prior)

mcmc_results <- run_mcmc(model, n_iter = 5000)
future_model <- model
future_model$y <- ts(rep(NA, 25), start = end(model$y), 
  frequency = frequency(model$y))
pred_gaussian <- predict(mcmc_results, future_model, 
  probs = c(0.05, 0.1, 0.5, 0.9, 0.95))
ts.plot(log10(JohnsonJohnson), pred_gaussian$intervals, 
  col = c(1, rep(2, 5)), lty = c(1, 2, 2, 1, 2, 2))

head(pred_gaussian$intervals)
head(pred_gaussian$MCSE)

# Non-gaussian models
## Not run: 
##D data("poisson_series")
##D 
##D model <- ng_bsm(poisson_series, sd_level = halfnormal(0.1, 1),
##D   sd_slope=halfnormal(0.01, 0.1), distribution = "poisson")
##D mcmc_poisson <- run_mcmc(model, n_iter = 5000, nsim = 10)
##D 
##D future_model <- model
##D future_model$y <- ts(rep(NA, 25), start = end(model$y), 
##D   frequency = frequency(model$y))
##D 
##D pred <- predict(mcmc_poisson, future_model, 
##D   probs = seq(0.05,0.95, by = 0.05))
##D 
##D library("ggplot2")
##D fit <- ts(colMeans(exp(expand_sample(mcmc_poisson, "alpha")$level)))
##D autoplot(pred, y = model$y, fit = fit)
## End(Not run)



