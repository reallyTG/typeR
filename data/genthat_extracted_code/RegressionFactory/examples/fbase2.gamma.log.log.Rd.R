library(RegressionFactory)


### Name: fbase2.gamma.log.log
### Title: Double-Parameter Base Log-likelihood Function for Gamma GLM
### Aliases: fbase2.gamma.log.log

### ** Examples

## Not run: 
##D # we use this library for univariate slice sampling
##D # of multivariate distributions
##D library(MfUSampler)
##D library(dglm)
##D 
##D # simulating data according to assumed generative model
##D # we assume log link functions for both mean and dispersion
##D # given variance function V(mu) = mu^2, we have:
##D # log(mu) = X%*%beta
##D # log(phi) = X%*%gamma
##D N <- 10000
##D K <- 5
##D X <- cbind(1,matrix(runif(N*(K-1), min=-0.5, max=+0.5), ncol=K-1))
##D beta <- runif(K, min=0.0, max=+1.0)
##D gamma <- runif(K, min=0.0, max=+1.0)
##D shape.vec <- 1 / exp(X%*%gamma)
##D rate.vec <- 1 / exp(X%*%gamma + X%*%beta)
##D y <- rgamma(N, shape = shape.vec, rate = rate.vec)
##D # implied dispersion:
##D dispersion.vec <- 1 / shape.vec
##D 
##D # model estimation using dglm package
##D reg.dglm <- dglm(y~X-1, dformula = ~X-1, family=Gamma(link="log"), dlink = "log")
##D beta.dglm <- reg.dglm$coefficients
##D gamma.dglm <- reg.dglm$dispersion.fit$coefficients
##D 
##D # model estimation using RegressionFactory
##D # (with univariate slice sampling)
##D # defining the log-likelihood using the expander framework
##D # assumng same covariates for both slots, hence we set Z=X
##D # slice sampler does not need derivatives, hence we set fgh=0
##D loglike.gamma <- function(coeff, X, y) {
##D   regfac.expand.2par(coeff, X=X, Z=X, y=y, fbase2=fbase2.gamma.log.log, fgh=0)
##D }
##D nsmp <- 100
##D coeff.smp <- array(NA, dim=c(nsmp, 2*K)) 
##D coeff.tmp <- rep(0.1, 2*K)
##D for (n in 1:nsmp) {
##D   coeff.tmp <- MfU.Sample(coeff.tmp, f=loglike.gamma, X=X, y=y)
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



