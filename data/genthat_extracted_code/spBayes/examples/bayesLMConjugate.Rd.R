library(spBayes)


### Name: bayesLMConjugate
### Title: Simple Bayesian linear model via the Normal/inverse-Gamma
###   conjugate
### Aliases: bayesLMConjugate
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D data(FORMGMT.dat)
##D 
##D n <- nrow(FORMGMT.dat)
##D p <- 7 ##an intercept and six covariates
##D 
##D n.samples <- 500
##D 
##D ## Below we demonstrate the conjugate function in the special case
##D ## with improper priors. The results are the same as for the above,
##D ## up to MC error. 
##D beta.prior.mean <- rep(0, times=p)
##D beta.prior.precision <- matrix(0, nrow=p, ncol=p)
##D 
##D prior.shape <- -p/2
##D prior.rate <- 0
##D 
##D m.1 <-
##D   bayesLMConjugate(Y ~ X1+X2+X3+X4+X5+X6, data = FORMGMT.dat,
##D                      n.samples, beta.prior.mean,
##D                      beta.prior.precision,
##D                      prior.shape, prior.rate)
##D 
##D summary(m.1$p.beta.tauSq.samples)
## End(Not run)



