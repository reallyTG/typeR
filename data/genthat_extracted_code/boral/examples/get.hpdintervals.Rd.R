library(boral)


### Name: get.hpdintervals
### Title: Highest posterior density intervals for an boral model
### Aliases: get.hpdintervals

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
##D n <- nrow(y)
##D p <- ncol(y)
##D     
##D ## Example 1 - model with two latent variables, site effects, 
##D ## 	and no environmental covariates
##D spiderfit_nb <- boral(y, family = "negative.binomial", lv.control = list(num.lv = 2),
##D     row.eff = "fixed", save.model = TRUE, mcmc.control = example_mcmc_control)
##D 
##D ## Returns a list with components corresponding to values described above.
##D spiderfit_nb$hpdintervals 
##D 
##D ## Example 2 - model with two latent variable, site effects, 
##D ## 	and environmental covariates
##D spiderfit_nb2 <- boral(y, X = spider$x, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2), row.eff = "fixed", save.model = TRUE,
##D     mcmc.control = example_mcmc_control)
##D 
##D ## Returns a list with components corresponding to values described above.
##D spiderfit_nb2$hpdintervals 
##D 
## End(Not run)



