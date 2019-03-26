library(MPS)


### Name: texpsg
### Title: truncated-exponential skew-symmetric G distribution
### Aliases: dtexpsg ptexpsg qtexpsg rtexpsg mpstexpsg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dtexpsg(x, "weibull", c(1,2,2,3))
ptexpsg(x, "weibull", c(1,2,2,3))
qtexpsg(runif(100), "weibull", c(1,2,2,3))
rtexpsg(100, "weibull", c(1,2,2,3))
mpstexpsg(x, "weibull", TRUE,"Nelder-Mead", 0.05)



