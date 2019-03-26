library(FAmle)


### Name: print.metropolis
### Title: Bayesian Estimation of Univariate Probability Distributions
### Aliases: print.metropolis
### Keywords: print models

### ** Examples


data(yarns)
x <- yarns$x
fit.x <- mle(x,'gamma',c(.1,.1))
bayes.x <- metropolis(fit.x,50,trans.list=
	list(function(x) exp(x), function(x) exp(x)))
print(bayes.x)
print(bayes.x,stats.fun=function(x) c(mean=mean(x),CV=sd(x)/mean(x)))



