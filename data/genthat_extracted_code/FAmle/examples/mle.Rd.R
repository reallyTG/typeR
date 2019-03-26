library(FAmle)


### Name: mle
### Title: Maximum Likelihood Estimation of Univariate Probability
###   Distributions
### Aliases: mle
### Keywords: optimize models

### ** Examples

data(yarns)
x <- yarns$x
fit.x <- mle(x,'weibull',c(.1,.1))
fit.x
names(fit.x)
#plot(fit.x)
#plot(fit.x,TRUE,alpha=.01)
p <- c(.9,.95,.99)
distr(p,model=fit.x,type='q')
Q.conf.int(p,fit.x,.01)
Q.conf.int(p,fit.x,.01,TRUE)



