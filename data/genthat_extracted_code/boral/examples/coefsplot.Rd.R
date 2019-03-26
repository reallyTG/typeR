library(boral)


### Name: coefsplot
### Title: Caterpillar plots of the regression coefficients from a boral
###   model
### Aliases: coefsplot

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
##D X <- scale(spider$x)
##D spiderfit_nb <- boral(y, X = X, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2), mcmc.control = example_mcmc_control)
##D 
##D 
##D ## Do separate line plots for all the coefficients of X
##D par(mfrow=c(2,3), mar = c(5,6,1,1))
##D sapply(colnames(spiderfit_nb$X), coefsplot, 
##D     spiderfit_nb)
## End(Not run)




