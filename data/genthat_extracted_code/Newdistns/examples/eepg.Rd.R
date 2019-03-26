library(Newdistns)


### Name: eepg
### Title: Exponentiated Exponential Poisson G Distribution
### Aliases: deepg peepg qeepg reepg meepg
### Keywords: Exponentiated exponential Poisson G distribution

### ** Examples
x=runif(10,min=0,max=1)
deepg(x,"exp",lambda=1,a=1)
peepg(x,"exp",lambda=1,a=1)
qeepg(x,"exp",lambda=1,a=1)
reepg(10,"exp",lambda=1,a=1)
meepg("exp",rexp(100),starts=c(1,1,1),method="BFGS")


