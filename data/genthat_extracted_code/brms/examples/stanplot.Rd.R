library(brms)


### Name: stanplot.brmsfit
### Title: MCMC Plots Implemented in 'bayesplot'
### Aliases: stanplot.brmsfit stanplot

### ** Examples

## Not run: 
##D model <- brm(count ~ log_Age_c + log_Base4_c * Trt 
##D              + (1|patient) + (1|visit),
##D              data = epilepsy, family = "poisson")
##D              
##D # plot posterior intervals
##D stanplot(model)
##D 
##D # only show population-level effects in the plots
##D stanplot(model, pars = "^b_")
##D 
##D # show histograms of the posterior distributions
##D stanplot(model, type = "hist")
##D 
##D # plot some diagnostics of the sampler
##D stanplot(model, type = "neff")
##D stanplot(model, type = "rhat")
##D 
##D # plot some diagnostics specific to the NUTS sampler
##D stanplot(model, type = "nuts_acceptance")
##D stanplot(model, type = "nuts_divergence")
## End(Not run)




