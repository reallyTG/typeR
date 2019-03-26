library(MPS)


### Name: gammag1
### Title: gamma uniform type I G distribution
### Aliases: dgammag1 pgammag1 qgammag1 rgammag1 mpsgammag1

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgammag1(x, "weibull", c(1,2,2,3))
pgammag1(x, "weibull", c(1,2,2,3))
qgammag1(runif(100), "weibull", c(1,2,2,3))
rgammag1(100, "weibull", c(1,2,2,3))
mpsgammag1(x, "weibull", TRUE, "Nelder-Mead", 0.05)



