library(MPS)


### Name: betag
### Title: beta G distribution
### Aliases: dbetag pbetag qbetag rbetag mpsbetag

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dbetag(x, "weibull", c(1,1,2,2,3))
pbetag(x, "weibull", c(1,1,2,2,3))
qbetag(runif(100), "weibull", c(1,1,2,2,3))
rbetag(100, "weibull", c(1,1,2,2,3))
mpsbetag(x, "weibull", TRUE, "Nelder-Mead", 0.05)



