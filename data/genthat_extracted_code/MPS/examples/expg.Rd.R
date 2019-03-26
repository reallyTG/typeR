library(MPS)


### Name: expg
### Title: exponentiated G distribution
### Aliases: dexpg pexpg qexpg rexpg mpsexpg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dexpg(x, "weibull", c(1,2,2,3))
pexpg(x, "weibull", c(1,2,2,3))
qexpg(runif(100), "weibull", c(1,2,2,3))
rexpg(100, "weibull", c(1,2,2,3))
mpsexpg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



