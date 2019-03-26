library(bayesplot)


### Name: MCMC-diagnostics
### Title: General MCMC diagnostics
### Aliases: MCMC-diagnostics mcmc_rhat mcmc_rhat_hist mcmc_rhat_data
###   mcmc_neff mcmc_neff_hist mcmc_neff_data mcmc_acf mcmc_acf_bar

### ** Examples

# autocorrelation
x <- example_mcmc_draws()
dim(x)
dimnames(x)

color_scheme_set("green")
mcmc_acf(x, pars = c("alpha", "beta[1]"))
## No test: 
color_scheme_set("pink")
(p <- mcmc_acf_bar(x, pars = c("alpha", "beta[1]")))

# add horiztonal dashed line at 0.5
p + hline_at(0.5, linetype = 2, size = 0.15, color = "gray")
## End(No test)

# fake rhat values to use for demonstration
rhat <- c(runif(100, 1, 1.15))
mcmc_rhat_hist(rhat)
mcmc_rhat(rhat)

# lollipops
color_scheme_set("purple")
mcmc_rhat(rhat[1:10], size = 5)

color_scheme_set("blue")
mcmc_rhat(runif(1000, 1, 1.07))
mcmc_rhat(runif(1000, 1, 1.3)) + legend_move("top") # add legend above plot

# fake neff ratio values to use for demonstration
ratio <- c(runif(100, 0, 1))
mcmc_neff_hist(ratio)
mcmc_neff(ratio)

## Not run: 
##D # Example using rstanarm model (requires rstanarm package)
##D library(rstanarm)
##D 
##D # intentionally use small 'iter' so there are some
##D # problems with rhat and neff for demonstration
##D fit <- stan_glm(mpg ~ ., data = mtcars, iter = 50)
##D rhats <- rhat(fit)
##D ratios <- neff_ratio(fit)
##D mcmc_rhat(rhats)
##D mcmc_neff(ratios, size = 3)
##D 
##D # there's a small enough number of parameters in the
##D # model that we can display their names on the y-axis
##D mcmc_neff(ratios) + yaxis_text(hjust = 1)
##D 
##D # can also look at autocorrelation
##D draws <- as.array(fit)
##D mcmc_acf(draws, pars = c("wt", "cyl"), lags = 10)
##D 
##D # increase number of iterations and plots look much better
##D fit2 <- update(fit, iter = 500)
##D mcmc_rhat(rhat(fit2))
##D mcmc_neff(neff_ratio(fit2))
##D mcmc_acf(as.array(fit2), pars = c("wt", "cyl"), lags = 10)
## End(Not run)




