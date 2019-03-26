library(propagate)


### Name: rDistr
### Title: Creating random samples from a variety of useful distributions
### Aliases: rDistr
### Keywords: algebra univariate

### ** Examples

## Not run: 
##D ## First we create random samples from the
##D ## von Mises distribution.
##D X <- propagate:::rmises(1000000, mu = 1, kappa = 2)
##D 
##D ## then we fit all available distributions
##D ## with 'fitDistr'.
##D fitDistr(X, nbin = 200)
##D ## => von Mises wins! (lowest BIC)
## End(Not run)



