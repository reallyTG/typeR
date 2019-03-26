library(boral)


### Name: get.residual.cor
### Title: Extract residual correlations and precisions from boral models
### Aliases: get.residual.cor

### ** Examples

## Not run: 
##D ## NOTE: The values below MUST NOT be used in a real application;
##D ## they are only used here to make the examples run quick!!!
##D example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
##D      n.thin = 1)
##D 
##D library(mvabund) ## Load a dataset from the mvabund package
##D library(corrplot) ## For plotting correlations
##D data(spider)
##D y <- spider$abun
##D n <- nrow(y)
##D p <- ncol(y)
##D     
##D spiderfit_nb <- boral(y, X = spider$x, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2), save.model = TRUE, 
##D     mcmc.control = example_mcmc_control)
##D 
##D res.cors <- get.residual.cor(spiderfit_nb)
##D 
##D corrplot(res.cors$sig.cor, title = "Residual correlations", 
##D     type = "lower", diag = FALSE, mar = c(3,0.5,2,1), tl.srt = 45)
## End(Not run)



