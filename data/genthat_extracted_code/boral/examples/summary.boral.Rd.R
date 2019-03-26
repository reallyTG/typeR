library(boral)


### Name: summary.boral
### Title: Summary of fitted boral object
### Aliases: summary.boral print.summary.boral

### ** Examples

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D     n.thin = 1)
##D 
##D library(mvabund) ## Load a dataset from the mvabund package
##D data(spider)
##D y <- spider$abun
##D 
##D spiderfit_nb <- boral(y, family = "negative.binomial", lv.control = list(num.lv = 2),
##D     row.eff = "fixed", mcmc.control = example_mcmc_control)
##D 
##D summary(spiderfit_nb)
## End(Not run)



