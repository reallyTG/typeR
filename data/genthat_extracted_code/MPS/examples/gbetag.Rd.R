library(MPS)


### Name: gbetag
### Title: generalized beta G distribution
### Aliases: dgbetag pgbetag qgbetag rgbetag mpsgbetag

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgbetag(x, "weibull", c(1,1,1,2,2,3))
pgbetag(x, "weibull", c(1,1,1,2,2,3))
qgbetag(runif(100), "weibull", c(1,1,1,2,2,3))
rgbetag(100, "weibull", c(1,1,1,2,2,3))
mpsgbetag(x, "weibull", TRUE, "Nelder-Mead", 0.05)



