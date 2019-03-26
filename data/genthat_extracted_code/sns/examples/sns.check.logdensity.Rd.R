library(sns)


### Name: sns.check.logdensity
### Title: Utility function for validating log-density
### Aliases: sns.check.logdensity print.sns.check.logdensity

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
##D my.check <- sns.check.logdensity(beta.init, loglike.poisson
##D   , X = X, y = y, blocks = list(1:K))
##D my.check
##D 
##D # mistake in log-likelihood gradient
##D loglike.poisson.wrong <- function(beta, X, y) {
##D   ret <- regfac.expand.1par(beta, X = X, y = y,
##D                             fbase1 = fbase1.poisson.log)
##D   ret$g <- 1.2 * ret$g
##D   return (ret)
##D }
##D # maximum relative diff in gradient is now much larger
##D my.check.wrong <- sns.check.logdensity(beta.init
##D   , loglike.poisson.wrong, X = X, y = y, blocks = list(1:K))
##D my.check.wrong
##D 
##D # mistake in log-likelihood Hessian
##D loglike.poisson.wrong.2 <- function(beta, X, y) {
##D   ret <- regfac.expand.1par(beta, X = X, y = y,
##D                             fbase1 = fbase1.poisson.log)
##D   ret$h <- 1.2 * ret$h
##D   return (ret)
##D }
##D # maximum relative diff in Hessian is now much larger
##D my.check.wrong.2 <- sns.check.logdensity(beta.init
##D   , loglike.poisson.wrong.2, X = X, y = y, blocks = list(1:K))
##D my.check.wrong.2
##D 
## End(Not run)



