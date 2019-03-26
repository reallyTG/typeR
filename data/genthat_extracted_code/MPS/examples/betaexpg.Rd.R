library(MPS)


### Name: betaexpg
### Title: beta exponential G distribution
### Aliases: dbetaexpg pbetaexpg qbetaexpg rbetaexpg mpsbetaexpg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dbetaexpg(x, "weibull", c(1,1,1,2,2,3))
pbetaexpg(x, "weibull", c(1,1,1,2,2,3))
qbetaexpg(runif(100), "weibull", c(1,1,1,2,2,3))
rbetaexpg(100, "weibull", c(1,1,1,2,2,3))
mpsbetaexpg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



