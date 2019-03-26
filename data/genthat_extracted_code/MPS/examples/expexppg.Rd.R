library(MPS)


### Name: expexppg
### Title: exponentiated exponential Poisson G distribution
### Aliases: dexpexppg pexpexppg qexpexppg rexpexppg mpsexpexppg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dexpexppg(x, "weibull", c(1,1,2,2,3))
pexpexppg(x, "weibull", c(1,1,2,2,3))
qexpexppg(runif(100), "weibull", c(1,1,2,2,3))
rexpexppg(100, "weibull", c(1,1,2,2,3))
mpsexpexppg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



