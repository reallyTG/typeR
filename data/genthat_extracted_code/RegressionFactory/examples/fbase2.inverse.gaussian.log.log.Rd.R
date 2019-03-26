library(RegressionFactory)


### Name: fbase2.inverse.gaussian.log.log
### Title: Double-Parameter Base Log-likelihood Function for
###   Inverse-Gaussian GLM
### Aliases: fbase2.inverse.gaussian.log.log

### ** Examples

## Not run: 
##D # we use this library for univariate slice sampling
##D # of multivariate distributions
##D library(MfUSampler)
##D library(dglm)
##D 
##D # simulating data according to assumed generative model
##D # we assume log link functions for both mean and dispersion
##D # (shape parameter is inverse of dispersion)
##D N <- 10000
##D K <- 5
##D X <- cbind(1,matrix(runif(N*(K-1), min=-0.5, max=+0.5), ncol=K-1))
##D beta <- runif(K, min=-0.5, max=+0.5)
##D gamma <- runif(K, min=-0.5, max=+0.5)
##D mean.vec <- exp(X %*% beta)
##D dispersion.vec <- exp(X %*% gamma)
##D y <- rinvgauss(N, mean = mean.vec, dispersion = dispersion.vec)
##D 
##D # model estimation using dglm package
##D reg.dglm <- dglm(y~X-1, dformula = ~X-1, family=inverse.gaussian(link="log"), dlink = "log")
##D beta.dglm <- reg.dglm$coefficients
##D gamma.dglm <- reg.dglm$dispersion.fit$coefficients
##D 
##D # model estimation using RegressionFactory
##D # (with univariate slice sampling)
##D # defining the log-likelihood using the expander framework
##D # assumng same covariates for both slots, hence we set Z=X
##D # slice sampler does not need derivatives, hence we set fgh=0
##D loglike.inverse.gaussian <- function(coeff, X, y) {
##D   regfac.expand.2par(coeff, X=X, Z=X, y=y, fbase2=fbase2.inverse.gaussian.log.log, fgh=0)
##D }
##D nsmp <- 100
##D coeff.smp <- array(NA, dim=c(nsmp, 2*K)) 
##D coeff.tmp <- rep(0.1, 2*K)
##D for (n in 1:nsmp) {
##D   coeff.tmp <- MfU.Sample(coeff.tmp, f=loglike.inverse.gaussian, X=X, y=y)
##D   coeff.smp[n,] <- coeff.tmp
##D }
##D beta.slice <- colMeans(coeff.smp[(nsmp/2+1):nsmp, 1:K])
##D gamma.slice <- colMeans(coeff.smp[(nsmp/2+1):nsmp, K+1:K])
##D 
##D # compare results
##D cbind(beta.dglm, beta.slice)
##D cbind(gamma.dglm, gamma.slice)
##D 
## End(Not run)



