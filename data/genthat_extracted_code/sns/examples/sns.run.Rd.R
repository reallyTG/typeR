library(sns)


### Name: sns.run
### Title: Drawing multiple samples using Stochastic Newton Sampler
### Aliases: sns.run
### Keywords: sampling, multivariate, mcmc, Metropolis

### ** Examples

## Not run: 
##D 
##D # using RegressionFactory for generating log-likelihood and its derivatives
##D library(RegressionFactory)
##D 
##D loglike.poisson <- function(beta, X, y) {
##D   regfac.expand.1par(beta, X = X, y = y,
##D     fbase1 = fbase1.poisson.log)
##D }
##D 
##D # simulating data
##D K <- 5
##D N <- 1000
##D X <- matrix(runif(N * K, -0.5, +0.5), ncol = K)
##D beta <- runif(K, -0.5, +0.5)
##D y <- rpois(N, exp(X ##D 
##D 
##D beta.init <- rep(0.0, K)
##D 
##D # glm estimate (ML), for reference
##D beta.glm <- glm(y ~ X - 1, family = "poisson",
##D                 start = beta.init)$coefficients
##D 
##D # sampling of likelihood
##D beta.smp <- sns.run(init = beta.init
##D   , fghEval = loglike.poisson, niter = 1000
##D   , nnr = 20, X = X, y = y)
##D smp.summ <- summary(beta.smp)
##D 
##D # compare mean of samples against ML estimate (from glm)
##D cbind(beta.glm, smp.summ$smp$mean)
##D 
##D # trying numerical differentiation
##D loglike.poisson.fonly <- function(beta, X, y) {
##D   regfac.expand.1par(beta, X = X, y = y, fgh = 0,
##D                      fbase1 = fbase1.poisson.log)
##D }
##D beta.smp <- sns.run(init = beta.init
##D   , fghEval = loglike.poisson.fonly, niter = 1000, nnr = 20
##D   , X = X, y = y, numderiv = 2)
##D smp.summ <- summary(beta.smp)
##D cbind(beta.glm, smp.summ$smp$mean)
##D 
## End(Not run)



