library(MCMCpack)


### Name: MCMCquantreg
### Title: Bayesian quantile regression using Gibbs sampling
### Aliases: MCMCquantreg
### Keywords: models

### ** Examples


## Not run: 
##D 
##D x<-rep(1:10,5)
##D y<-rnorm(50,mean=x)
##D posterior_50 <- MCMCquantreg(y~x)
##D posterior_95 <- MCMCquantreg(y~x, tau=0.95, verbose=10000,
##D     mcmc=50000, thin=10, seed=2)
##D plot(posterior_50)
##D plot(posterior_95)
##D raftery.diag(posterior_50)
##D autocorr.plot(posterior_95)
##D summary(posterior_50)
##D summary(posterior_95)
## End(Not run)




