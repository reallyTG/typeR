library(RegressionFactory)


### Name: fbase1.poisson.log
### Title: Single-Parameter Base Log-likelihood Function for Poisson GLM
### Aliases: fbase1.poisson.log

### ** Examples

## Not run: 
##D library(sns)
##D library(MfUSampler)
##D 
##D # using the expander framework and base distributions to define
##D # log-likelihood function for Poisson regression
##D loglike.poisson <- function(beta, X, y, fgh) {
##D   regfac.expand.1par(beta, X, y, fbase1.poisson.log, fgh)
##D }
##D 
##D # generate data for Poisson regression
##D N <- 1000
##D K <- 5
##D X <- matrix(runif(N*K, min=-0.5, max=+0.5), ncol=K)
##D beta <- runif(K, min=-0.5, max=+0.5)
##D y <- rpois(N, lambda = exp(X%*%beta))
##D 
##D # obtaining glm coefficients for comparison
##D beta.glm <- glm(y~X-1, family="poisson")$coefficients
##D 
##D # mcmc sampling of log-likelihood
##D nsmp <- 100
##D 
##D # Slice Sampler (no derivatives needed)
##D beta.smp <- array(NA, dim=c(nsmp,K)) 
##D beta.tmp <- rep(0,K)
##D for (n in 1:nsmp) {
##D   beta.tmp <- MfU.Sample(beta.tmp
##D     , f=loglike.poisson, X=X, y=y, fgh=0)
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
##D           loglike.poisson(beta, X, y, fgh=1)$g
##D         else
##D           loglike.poisson(beta, X, y, fgh=0)
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
##D   beta.tmp <- sns(beta.tmp, fghEval=loglike.poisson, X=X, y=y, fgh=2, rnd = n>nsmp/4)
##D   beta.smp[n,] <- beta.tmp
##D }
##D beta.sns <- colMeans(beta.smp[(nsmp/2+1):nsmp,])
##D 
##D # compare results
##D cbind(beta.glm, beta.slice, beta.ars, beta.sns)
## End(Not run)



