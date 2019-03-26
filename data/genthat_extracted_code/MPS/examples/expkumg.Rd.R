library(MPS)


### Name: expkumg
### Title: exponentiated Kumaraswamy G distribution
### Aliases: dexpkumg pexpkumg qexpkumg rexpkumg mpsexpkumg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dexpkumg(x, "weibull", c(1,1,1,2,2,3))
pexpkumg(x, "weibull", c(1,1,1,2,2,3))
qexpkumg(runif(100), "weibull", c(1,1,1,2,2,3))
rexpkumg(100, "weibull", c(1,1,1,2,2,3))
mpsexpkumg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



