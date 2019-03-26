library(boral)


### Name: get.measures
### Title: Information Criteria for boral models
### Aliases: get.measures

### ** Examples

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D      n.thin = 1)
##D      
##D library(mvabund) ## Load a dataset from the mvabund package
##D data(spider)
##D y <- spider$abun
##D n <- nrow(y)
##D p <- ncol(y)
##D 
##D spiderfit_pois <- boral(y, family = "poisson", 
##D     lv.control = list(num.lv = 2), row.eff = "random",
##D     mcmc.control = example_mcmc_control)
##D 
##D spiderfit_pois$ics ## Returns information criteria
##D 
##D spiderfit_nb <- boral(y, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2), row.eff = "random",
##D     mcmc.control = example_mcmc_control)
##D 
##D spiderfit_nb$ics ## Returns the information criteria 
## End(Not run)



