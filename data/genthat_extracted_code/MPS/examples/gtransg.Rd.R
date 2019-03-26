library(MPS)


### Name: gtransg
### Title: exponentiated exponential Poisson G distribution
### Aliases: dgtransg pgtransg qgtransg rgtransg mpsgtransg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dgtransg(x, "weibull", c(1,0.5,2,2,3))
pgtransg(x, "weibull", c(1,0.5,2,2,3))
qgtransg(runif(100), "weibull", c(1,0.5,2,2,3))
rgtransg(100, "weibull", c(1,0.5,2,2,3))
mpsgtransg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



