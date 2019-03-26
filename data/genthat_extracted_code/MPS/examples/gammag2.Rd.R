library(MPS)


### Name: gammag2
### Title: gamma uniform type II G distribution
### Aliases: dgammag2 pgammag2 qgammag2 rgammag2 mpsgammag2

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgammag2(x, "weibull", c(1,2,2,3))
pgammag2(x, "weibull", c(1,2,2,3))
qgammag2(runif(100), "weibull", c(1,2,2,3))
rgammag2(100, "weibull", c(1,2,2,3))
mpsgammag2(x, "weibull", TRUE, "Nelder-Mead", 0.05)



