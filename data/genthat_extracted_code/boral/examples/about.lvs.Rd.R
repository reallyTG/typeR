library(boral)


### Name: about.lvs
### Title: Correlation structure for latent variables
### Aliases: about.lvs

### ** Examples

library(mvabund) ## Load a dataset from the mvabund package
data(spider)
y <- spider$abun
X <- scale(spider$x)
n <- nrow(y)
p <- ncol(y)

## NOTE: The two examples below and taken directly from the boral help file

example_mcmc_control <- list(n.burnin = 10, n.iteration = 100, 
     n.thin = 1)

## Not run: 
##D ## Example 2d - model with environmental covariates and 
##D ##  two structured latent variables using fake distance matrix
##D fakedistmat <- as.matrix(dist(1:n))
##D spiderfit_lvstruc <- boral(y, X = X, family = "negative.binomial", 
##D     lv.control = list(num.lv = 2, type = "powered.exponential", 
##D     distmat = fakedistmat))
##D 
##D summary(spiderfit_lvstruc)
##D 
##D     
## End(Not run)




