library(RegressionFactory)


### Name: regfac.expand.2par
### Title: Expander Function for Two-Parameter Base Distributions
### Aliases: regfac.expand.2par

### ** Examples

## Not run: 
##D library(dglm)
##D library(sns)
##D 
##D # defining log-likelihood function
##D loglike.linreg <- function(coeff, X, y) {
##D   regfac.expand.2par(coeff = coeff, X = X, Z = X, y = y
##D     , fbase2 = fbase2.gaussian.identity.log, fgh = 2, block.diag = T)
##D }
##D 
##D # simulating data according to generative model
##D N <- 1000 # number of observations
##D K <- 5 # number of covariates
##D X <- matrix(runif(N*K, min=-0.5, max=+0.5), ncol=K)
##D beta <- runif(K, min=-0.5, max=+0.5)
##D gamma <- runif(K, min=-0.5, max=+0.5)
##D mean.vec <- X%*%beta
##D sd.vec <- exp(X%*%gamma)
##D y <- rnorm(N, mean.vec, sd.vec)
##D 
##D # estimation using dglm
##D est.dglm <- dglm(y~X-1, dformula = ~X-1, family = "gaussian", dlink = "log")
##D beta.dglm <- est.dglm$coefficients
##D gamma.dglm <- est.dglm$dispersion.fit$coefficients
##D 
##D # estimation using RegressionFactory
##D coeff.tmp <- rep(0, 2*K)
##D for (n in 1:10) {
##D   coeff.tmp <- sns(coeff.tmp, fghEval=loglike.linreg
##D     , X=X, y=y, rnd = F)
##D }
##D beta.regfac.vd <- coeff.tmp[1:K]
##D gamma.regfac.vd <- coeff.tmp[K+1:K]
##D 
##D # comparing dglm and RegressionFactory results
##D # neither beta's nor gamma's will match exactly
##D cbind(beta.dglm, beta.regfac.vd)
##D cbind(gamma.dglm, gamma.regfac.vd)
## End(Not run)



