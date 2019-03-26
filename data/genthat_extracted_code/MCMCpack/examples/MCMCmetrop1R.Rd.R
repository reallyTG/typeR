library(MCMCpack)


### Name: MCMCmetrop1R
### Title: Metropolis Sampling from User-Written R function
### Aliases: MCMCmetrop1R
### Keywords: models

### ** Examples


  ## Not run: 
##D 
##D     ## logistic regression with an improper uniform prior
##D     ## X and y are passed as args to MCMCmetrop1R
##D 
##D     logitfun <- function(beta, y, X){
##D       eta <- X %*% beta
##D       p <- 1.0/(1.0+exp(-eta))
##D       sum( y * log(p) + (1-y)*log(1-p) )
##D     }
##D 
##D     x1 <- rnorm(1000)
##D     x2 <- rnorm(1000)
##D     Xdata <- cbind(1,x1,x2)
##D     p <- exp(.5 - x1 + x2)/(1+exp(.5 - x1 + x2))
##D     yvector <- rbinom(1000, 1, p)
##D 
##D     post.samp <- MCMCmetrop1R(logitfun, theta.init=c(0,0,0),
##D                               X=Xdata, y=yvector,
##D                               thin=1, mcmc=40000, burnin=500,
##D                               tune=c(1.5, 1.5, 1.5),
##D                               verbose=500, logfun=TRUE)
##D 
##D     raftery.diag(post.samp)
##D     plot(post.samp)
##D     summary(post.samp)
##D     ## ##################################################
##D 
##D 
##D     ##  negative binomial regression with an improper unform prior
##D     ## X and y are passed as args to MCMCmetrop1R
##D     negbinfun <- function(theta, y, X){
##D       k <- length(theta)
##D       beta <- theta[1:(k-1)]
##D       alpha <- exp(theta[k])
##D       mu <- exp(X %*% beta)
##D       log.like <- sum(
##D                       lgamma(y+alpha) - lfactorial(y) - lgamma(alpha) +
##D                       alpha * log(alpha/(alpha+mu)) +
##D                       y * log(mu/(alpha+mu))
##D                      )
##D     }
##D 
##D     n <- 1000
##D     x1 <- rnorm(n)
##D     x2 <- rnorm(n)
##D     XX <- cbind(1,x1,x2)
##D     mu <- exp(1.5+x1+2*x2)*rgamma(n,1)
##D     yy <- rpois(n, mu)
##D 
##D     post.samp <- MCMCmetrop1R(negbinfun, theta.init=c(0,0,0,0), y=yy, X=XX,
##D                               thin=1, mcmc=35000, burnin=1000,
##D                               tune=1.5, verbose=500, logfun=TRUE,
##D                               seed=list(NA,1))
##D     raftery.diag(post.samp)
##D     plot(post.samp)
##D     summary(post.samp)
##D     ## ##################################################
##D 
##D 
##D     ## sample from a univariate normal distribution with
##D     ## mean 5 and standard deviation 0.1
##D     ##
##D     ## (MCMC obviously not necessary here and this should
##D     ##  really be done with the logdensity for better
##D     ##  numerical accuracy-- this is just an illustration of how
##D     ##  MCMCmetrop1R works with a density rather than logdensity)
##D 
##D     post.samp <- MCMCmetrop1R(dnorm, theta.init=5.3, mean=5, sd=0.1,
##D                           thin=1, mcmc=50000, burnin=500,
##D                           tune=2.0, verbose=5000, logfun=FALSE)
##D 
##D     summary(post.samp)
##D 
##D   
## End(Not run)




