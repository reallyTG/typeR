library(MPS)


### Name: gexppg
### Title: geometric exponential Poisson G distribution
### Aliases: dgexppg pgexppg qgexppg rgexppg mpsgexppg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgexppg(x, "weibull", c(1,0.5,2,2,3))
pgexppg(x, "weibull", c(1,0.5,2,2,3))
qgexppg(runif(100), "weibull", c(1,0.5,2,2,3))
rgexppg(100, "weibull", c(1,0.5,2,2,3))
mpsgexppg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



