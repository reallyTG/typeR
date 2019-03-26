library(MPS)


### Name: weibullextg
### Title: T-X'{log-logistic}' G distribution
### Aliases: dweibullextg pweibullextg qweibullextg rweibullextg
###   mpsweibullextg

### ** Examples

x<-rweibull(100, shape=2, scale=2)+3
dweibullextg(x, "weibull", c(1,1,2,2,3))
pweibullextg(x, "weibull", c(1,1,2,2,3))
qweibullextg(runif(100), "weibull", c(1,1,2,2,3))
rweibullextg(100, "weibull", c(1,1,2,2,3))
mpsweibullextg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



