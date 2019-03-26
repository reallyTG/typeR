library(RegressionFactory)


### Name: fbase1.exponential.log
### Title: Single-Parameter Base Log-likelihood Function for Exponential
###   GLM
### Aliases: fbase1.exponential.log

### ** Examples

## Not run: 
##D library(sns)
##D library(MfUSampler)
##D 
##D # using the expander framework and base distributions to define
##D # log-likelihood function for exponential regression
##D loglike.exponential <- function(beta, X, y, fgh) {
##D   regfac.expand.1par(beta, X, y, fbase1.exponential.log, fgh)
##D }
##D 
##D # generate data for exponential regression
##D N <- 1000
##D K <- 5
##D X <- matrix(runif(N*K, min=-0.5, max=+0.5), ncol=K)
##D beta <- runif(K, min=-0.5, max=+0.5)
##D y <- rexp(N, rate = exp(-X%*%beta))
##D 
##D # mcmc sampling of log-likelihood
##D nsmp <- 100
##D 
##D # Slice Sampler (no derivatives needed)
##D beta.smp <- array(NA, dim=c(nsmp,K)) 
##D beta.tmp <- rep(0,K)
##D for (n in 1:nsmp) {
##D   beta.tmp <- MfU.Sample(beta.tmp
##D     , f=loglike.exponential, X=X, y=y, fgh=0)
##D   beta.smp[n,] <- beta.tmp
##D }
##D beta.slice <- colMeans(beta.smp[(nsmp/2+1):nsmp,])
##D 
##D # Adaptive Rejection Sampler
##D # (only first derivative needed)
##D beta.smp <- array(NA, dim=c(nsmp,K)) 
##D beta.tmp <- rep(0,K)
##D for (n in 1:nsmp) {
##D   beta.tmp <- MfU.Sample(beta.tmp, uni.sampler="ars"
##D     , f=function(beta, X, y, grad) {
##D         if (grad)
##D           loglike.exponential(beta, X, y, fgh=1)$g
##D         else
##D           loglike.exponential(beta, X, y, fgh=0)
##D       }
##D     , X=X, y=y)
##D   beta.smp[n,] <- beta.tmp
##D }
##D beta.ars <- colMeans(beta.smp[(nsmp/2+1):nsmp,])
##D 
##D # SNS (Stochastic Newton Sampler)
##D # (both first and second derivative needed)
##D beta.smp <- array(NA, dim=c(nsmp,K)) 
##D beta.tmp <- rep(0,K)
##D for (n in 1:nsmp) {
##D   beta.tmp <- sns(beta.tmp, fghEval=loglike.exponential, X=X, y=y, fgh=2)
##D   beta.smp[n,] <- beta.tmp
##D }
##D beta.sns <- colMeans(beta.smp[(nsmp/2+1):nsmp,])
##D 
##D # compare results
##D cbind(beta, beta.slice, beta.ars, beta.sns)
##D 
## End(Not run)



