library(boral)


### Name: get.dic
### Title: Extract Deviance Information Criterion for boral model
### Aliases: get.dic

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
##D spiderfit_nb <- boral(y, family = "negative.binomial", lv.control = list(num.lv = 2),
##D      save.model = TRUE, calc.ics = TRUE, mcmc.control = example_mcmc_control)
##D 
##D spiderfit_nb$ics ## DIC returned as one of several information criteria.
## End(Not run)



