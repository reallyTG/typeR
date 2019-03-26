library(MPS)


### Name: mokumg
### Title: Marshall-Olkin Kumaraswamy G distribution
### Aliases: dmokumg pmokumg qmokumg rmokumg mpsmokumg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dmokumg(x, "weibull", c(1,1,1,2,2,3))
pmokumg(x, "weibull", c(1,1,1,2,2,3))
qmokumg(runif(100), "weibull", c(1,1,1,2,2,3))
rmokumg(100, "weibull", c(1,1,1,2,2,3))
mpsmokumg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



