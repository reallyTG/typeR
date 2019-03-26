library(brms)


### Name: plot.brmsfit
### Title: Trace and Density Plots for MCMC Samples
### Aliases: plot.brmsfit

### ** Examples

## Not run: 
##D  
##D fit <- brm(count ~ log_Age_c + log_Base4_c * Trt_c 
##D            + (1|patient) + (1|visit), 
##D            data = epilepsy, family = "poisson")
##D plot(fit)
##D ## plot population-level effects only
##D plot(fit, pars = "^b_") 
## End(Not run)




