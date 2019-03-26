library(MPS)


### Name: gammag
### Title: gamma uniform G distribution
### Aliases: dgammag pgammag qgammag rgammag mpsgammag

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgammag(x, "weibull", c(1,2,2,3))
pgammag(x, "weibull", c(1,2,2,3))
qgammag(runif(100), "weibull", c(1,2,2,3))
rgammag(100, "weibull", c(1,2,2,3))
mpsgammag(x, "weibull", TRUE, "Nelder-Mead", 0.05)



