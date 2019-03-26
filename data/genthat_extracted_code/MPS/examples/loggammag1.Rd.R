library(MPS)


### Name: loggammag1
### Title: log gamma G type I distribution
### Aliases: dloggammag1 ploggammag1 qloggammag1 rloggammag1 mpsloggammag1

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dloggammag1(x, "weibull", c(1,1,2,2,3))
ploggammag1(x, "weibull", c(1,1,2,2,3))
qloggammag1(runif(100), "weibull", c(1,1,2,2,3))
rloggammag1(100, "weibull", c(1,1,2,2,3))
mpsloggammag1(x, "weibull", TRUE, "Nelder-Mead", 0.05)



