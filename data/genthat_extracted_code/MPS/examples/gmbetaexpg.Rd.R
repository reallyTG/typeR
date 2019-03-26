library(MPS)


### Name: gmbetaexpg
### Title: gamma-X family of modified beta exponential G distribution
### Aliases: dgmbetaexpg pgmbetaexpg qgmbetaexpg rgmbetaexpg mpsgmbetaexpg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgmbetaexpg(x, "weibull", c(1,1,2,2,3))
pgmbetaexpg(x, "weibull", c(1,1,2,2,3))
qgmbetaexpg(runif(100), "weibull", c(1,1,2,2,3))
rgmbetaexpg(100, "weibull", c(1,1,2,2,3))
mpsgmbetaexpg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



