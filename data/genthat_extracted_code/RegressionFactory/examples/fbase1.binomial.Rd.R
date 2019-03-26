library(RegressionFactory)


### Name: fbase1.binomial.logit
### Title: Single-Parameter Base Log-likelihood Function(s) for Binomial
###   GLM
### Aliases: fbase1.binomial.logit fbase1.binomial.probit
###   fbase1.binomial.cauchit fbase1.binomial.cloglog

### ** Examples

## Not run: 
##D library(sns)
##D library(MfUSampler)
##D 
##D # using the expander framework and binomial base log-likelihood
##D # to define log-likelihood function for binary logit regression
##D loglike.logit <- function(beta, X, y, fgh) {
##D   regfac.expand.1par(beta, X, y, fbase1.binomial.logit, fgh, n=1)
##D }
##D 
##D # generate data for logistic regression
##D N <- 1000
##D K <- 5
##D X <- matrix(runif(N*K, min=-0.5, max=+0.5), ncol=K)
##D beta <- runif(K, min=-0.5, max=+0.5)
##D y <- 1*(runif(N) < 1.0/(1+exp(-X%*%beta)))
##D 
##D # obtaining glm coefficients for comparison
##D beta.glm <- glm(y~X-1, family="binomial")$coefficients
##D 
##D # mcmc sampling of log-likelihood
##D nsmp <- 100
##D 
##D # Slice Sampler (no derivatives needed)
##D beta.smp <- array(NA, dim=c(nsmp,K)) 
##D beta.tmp <- rep(0,K)
##D for (n in 1:nsmp) {
##D   beta.tmp <- MfU.Sample(beta.tmp
##D     , f=function(beta, X, y) loglike.logit(beta, X, y, fgh=0), X=X, y=y)
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
##D           loglike.logit(beta, X, y, fgh=1)$g
##D         else
##D           loglike.logit(beta, X, y, fgh=0)
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
##D   beta.tmp <- sns(beta.tmp, fghEval=loglike.logit, X=X, y=y, fgh=2)
##D   beta.smp[n,] <- beta.tmp
##D }
##D beta.sns <- colMeans(beta.smp[(nsmp/2+1):nsmp,])
##D 
##D # compare results
##D cbind(beta.glm, beta.slice, beta.ars, beta.sns)
## End(Not run)



