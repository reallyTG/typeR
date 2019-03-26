library(MPS)


### Name: weibullg
### Title: Weibull G distribution
### Aliases: dweibullg pweibullg qweibullg rweibullg mpsweibullg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dweibullg(x, "weibull", c(1,1,2,2,3))
pweibullg(x, "weibull", c(1,1,2,2,3))
qweibullg(runif(100), "weibull", c(1,1,2,2,3))
rweibullg(100, "weibull", c(1,1,2,2,3))
mpsweibullg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



