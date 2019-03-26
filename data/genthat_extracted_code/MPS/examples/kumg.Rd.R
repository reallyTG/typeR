library(MPS)


### Name: kumg
### Title: Kumaraswamy G distribution
### Aliases: dkumg pkumg qkumg rkumg mpskumg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dkumg(x, "weibull", c(1,1,2,2,3))
pkumg(x, "weibull", c(1,1,2,2,3))
qkumg(runif(100), "weibull", c(1,1,2,2,3))
rkumg(100, "weibull", c(1,1,2,2,3))
mpskumg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



