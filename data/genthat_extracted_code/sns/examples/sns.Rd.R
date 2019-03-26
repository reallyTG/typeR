library(sns)


### Name: sns
### Title: Stochastic Newton Sampler (SNS)
### Aliases: sns
### Keywords: sampling, multivariate, mcmc, Metropolis

### ** Examples

## Not run: 
##D 
##D # using RegressionFactory for generating log-likelihood and its derivatives
##D library(RegressionFactory)
##D 
##D loglike.poisson <- function(beta, X, y) {
##D   regfac.expand.1par(beta, X = X, y = y,
##D                      fbase1 = fbase1.poisson.log)
##D }
##D 
##D # simulating data
##D K <- 5
##D N <- 1000
##D X <- matrix(runif(N * K, -0.5, +0.5), ncol = K)
##D beta <- runif(K, -0.5, +0.5)
##D y <- rpois(N, exp(X %*% beta))
##D 
##D beta.init <- rep(0.0, K)
##D 
##D # glm estimate, for reference
##D beta.glm <- glm(y ~ X - 1, family = "poisson",
##D                 start = beta.init)$coefficients
##D 
##D # running SNS in non-stochastic mode
##D # this should produce results very close to glm
##D beta.sns <- beta.init
##D for (i in 1:20)
##D   beta.sns <- sns(beta.sns, loglike.poisson, X = X, y = y, rnd = F)
##D 
##D # comparison
##D all.equal(as.numeric(beta.glm), as.numeric(beta.sns))
##D 
##D # trying numerical differentiation
##D loglike.poisson.fonly <- function(beta, X, y) {
##D   regfac.expand.1par(beta, X = X, y = y, fgh = 0,
##D                      fbase1 = fbase1.poisson.log)
##D }
##D 
##D beta.sns.numderiv <- beta.init
##D for (i in 1:20)
##D   beta.sns.numderiv <- sns(beta.sns.numderiv, loglike.poisson.fonly
##D                   , X = X, y = y, rnd = F, numderiv = 2)
##D all.equal(as.numeric(beta.glm), as.numeric(beta.sns.numderiv))
##D 
##D # add numerical derivatives to fghEval outside sns
##D loglike.poisson.numaug <- sns.fghEval.numaug(loglike.poisson.fonly
##D   , numderiv = 2)
##D 
##D beta.sns.numaug <- beta.init
##D for (i in 1:20)
##D   # set numderiv to 0 to avoid repeating 
##D   # numerical augmentation inside sns
##D   beta.sns.numaug <- sns(beta.sns.numaug, loglike.poisson.numaug
##D                            , X = X, y = y, rnd = F, numderiv = 0)
##D all.equal(as.numeric(beta.glm), as.numeric(beta.sns.numaug))
##D 
## End(Not run)



