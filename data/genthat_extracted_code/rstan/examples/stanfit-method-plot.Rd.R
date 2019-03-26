library(rstan)


### Name: plot-methods
### Title: Plots for stanfit objects
### Aliases: plot,stanfit-method plot,stanfit,missing-method
### Keywords: methods

### ** Examples

## Not run: 
##D library(rstan)
##D fit <- stan_demo("eight_schools")
##D plot(fit)
##D plot(fit, show_density = TRUE, ci_level = 0.5, fill_color = "purple")
##D plot(fit, plotfun = "hist", pars = "theta", include = FALSE)
##D plot(fit, plotfun = "trace", pars = c("mu", "tau"), inc_warmup = TRUE)
##D plot(fit, plotfun = "rhat") + ggtitle("Example of adding title to plot")
## End(Not run)



