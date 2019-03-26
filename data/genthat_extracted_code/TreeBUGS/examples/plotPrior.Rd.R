library(TreeBUGS)


### Name: plotPrior
### Title: Plot Prior Distributions
### Aliases: plotPrior

### ** Examples

## Not run: 
##D # default priors for traitMPT:
##D plotPrior(list(mu = "dnorm(0,1)", xi="dunif(0,10)",
##D           V=diag(2), df=2+1), M=4000)
##D 
##D # default priors for betaMPT:
##D plotPrior(list(alpha ="dgamma(1,.1)",
##D           beta = "dgamma(1,.1)"), M=4000)
## End(Not run)



