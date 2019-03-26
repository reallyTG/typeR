library(RegressionFactory)


### Name: regfac.expand.1par
### Title: Expander Function for Single-Parameter Base Distributions
### Aliases: regfac.expand.1par

### ** Examples

## Not run: 
##D library(sns)
##D # simulating logistic regression data
##D N <- 1000 # number of observations
##D K <- 10 # number of variables
##D X <- matrix(runif(N*K, min=-0.5, max=+0.5), ncol=K)
##D beta <- runif(K, min=-0.5, max=+0.5)
##D Xbeta <- X%*%beta
##D y <- 1*(runif(N)<1/(1+exp(-Xbeta)))
##D beta.est <- rep(0,K)
##D # run sns in non-stochastic mode, i.e. Newton-Raphson optimization
##D for (i in 1:10) {
##D   beta.est <- sns(beta.est, regfac.expand.1par, rnd=F, X=X, y=y
##D     , fbase1=fbase1.binomial.logit)
##D }
##D # use glm to estimate beta and compare
##D beta.est.glm <- glm(y~X-1, family="binomial")$coefficients
##D cbind(beta.est, beta.est.glm)
## End(Not run)



