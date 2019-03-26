library(FAmle)


### Name: metropolis
### Title: Bayesian Estimation of Univariate Probability Distributions
### Aliases: metropolis
### Keywords: models

### ** Examples


### These examples should be re-run with, e.g., iter > 2000.
data(yarns)
x <- yarns$x
fit.x <- mle(x,'gamma',c(.1,.1))
bayes.x.no.prior <- metropolis(model=fit.x,iter=150,
	trans.list=list(function(x) x,function(x) exp(x)))
plot(bayes.x.no.prior)

# examples of prior distributions (note that these prior distribution
#	are specified for the transformated parameters;
#	i.e., in this case, 'meanlog' -> 'meanlog' and 'sdlog' -> 'ln.sdlog')
# for the scale parameter only
prior.1 <- function(x) dnorm(x[2],.8,.1)
# for both parameters (joint but independent in this case)
prior.2 <- function(x) dunif(x[1],3.4,3.6)*dnorm(x[2],1,1)

bayes.x.prior.2 <- metropolis(model=fit.x,iter=150,
	trans.list=list(function(x) x,function(x) exp(x)),prior=prior.2)
plot(bayes.x.prior.2)

# Example where 'model' is not from the class 'mle'; i.e.
# both 'start' and 'variance' need to be specified!
#x <- rweibull(5,2,1)
x <- c(0.9303492,1.0894917,0.9628029,0.6145032,0.4756699)
# Here 'fit.x <- mle(x,'weibull',c(.1,.1))' is not used,
model.x <- list(x=x,dist='weibull')
# and an informative prior distribution is considered to ensure a proper posterior distribution
prior.x <- function(x) dnorm(x[1],log(2),.1)*dnorm(x[2],log(1),.1)
trans.list.x <- list(function(x) exp(x), function(x) exp(x))
bayes.x <- metropolis(model=model.x,iter=150,prior=prior.x,trans.list=trans.list.x,
            pass.down.to.C=TRUE,start=c(0,0),variance=diag(.1,2,2))




