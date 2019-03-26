library(boral)


### Name: plot.boral
### Title: Plots of a fitted boral object
### Aliases: plot.boral

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
##D spider.fit.p <- boral(y, family = "poisson", lv.control = list(num.lv = 2),
##D     row.eff = "fixed", mcmc.control = example_mcmc_control)
##D 
##D par(mfrow = c(2,2))
##D plot(spider.fit.p) 
##D ## A distinct fan pattern is observed in the plot of residuals 
##D ## versus linear predictors plot. 
##D 
##D 
##D spiderfit_nb <- boral(y, family = "negative.binomial", lv.control = list(num.lv = 2), 
##D     row.eff = "fixed", mcmc.control = example_mcmc_control)
##D 
##D par(mfrow = c(2,2))
##D plot(spiderfit_nb) 
##D ## The fan shape is not as clear now, 
##D ## and the normal quantile plot also suggests a better fit to the data 
## End(Not run)



