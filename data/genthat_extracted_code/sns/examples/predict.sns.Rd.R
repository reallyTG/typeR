library(sns)


### Name: predict.sns
### Title: Sample-based prediction using "sns" Objects
### Aliases: predict.sns summary.predict.sns print.summary.predict.sns

### ** Examples


## Not run: 
##D 
##D # using RegressionFactory for generating log-likelihood and derivatives
##D library("RegressionFactory")
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
##D y <- rpois(N, exp(X %*% beta))
##D 
##D beta.init <- rep(0.0, K)
##D beta.smp <- sns.run(beta.init, loglike.poisson,
##D   niter = 1000, nnr = 20, mh.diag = TRUE, X = X, y = y)
##D 
##D # prediction function for mean response
##D predmean.poisson <- function(beta, Xnew) exp(Xnew %*% beta)
##D ymean.new <- predict(beta.smp, predmean.poisson,
##D                      nburnin = 100, Xnew = X)
##D summary(ymean.new)
##D 
##D # (stochastic) prediction function for response
##D predsmp.poisson <- function(beta, Xnew)
##D   rpois(nrow(Xnew), exp(Xnew %*% beta))
##D ysmp.new <- predict(beta.smp, predsmp.poisson
##D                     , nburnin = 100, Xnew = X)
##D summary(ysmp.new)
##D 
## End(Not run)




