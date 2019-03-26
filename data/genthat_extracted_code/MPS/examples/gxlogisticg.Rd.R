library(MPS)


### Name: gxlogisticg
### Title: gamma-X generated of log-logistic-X familiy of G distribution
### Aliases: dgxlogisticg pgxlogisticg qgxlogisticg rgxlogisticg
###   mpsgxlogisticg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgxlogisticg(x, "weibull", c(1,2,2,3))
pgxlogisticg(x, "weibull", c(1,2,2,3))
qgxlogisticg(runif(100), "weibull", c(1,2,2,3))
rgxlogisticg(100, "weibull", c(1,2,2,3))
mpsgxlogisticg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



