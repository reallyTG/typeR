library(MPS)


### Name: loggammag2
### Title: log gamma G type II distribution
### Aliases: dloggammag2 ploggammag2 qloggammag2 rloggammag2 mpsloggammag2

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dloggammag2(x, "weibull", c(1,1,2,2,3))
ploggammag2(x, "weibull", c(1,1,2,2,3))
qloggammag2(runif(100), "weibull", c(1,1,2,2,3))
rloggammag2(100, "weibull", c(1,1,2,2,3))
mpsloggammag2(x, "weibull", TRUE, "Nelder-Mead", 0.05)



