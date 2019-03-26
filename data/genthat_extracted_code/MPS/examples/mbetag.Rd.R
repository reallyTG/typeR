library(MPS)


### Name: mbetag
### Title: modified beta G distribution
### Aliases: dmbetag pmbetag qmbetag rmbetag mpsmbetag

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dmbetag(x, "weibull", c(1,1,1,2,2,3))
pmbetag(x, "weibull", c(1,1,1,2,2,3))
qmbetag(runif(100), "weibull", c(1,1,1,2,2,3))
rmbetag(100, "weibull", c(1,1,1,2,2,3))
mpsmbetag(x, "weibull", TRUE, "Nelder-Mead", 0.05)



