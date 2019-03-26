library(Newdistns)


### Name: gepg
### Title: Geometric Exponential Poisson G Distribution
### Aliases: dgepg pgepg qgepg rgepg mgepg
### Keywords: Geometric exponential Poisson G distribution

### ** Examples
x=runif(10,min=0,max=1)
dgepg(x,"exp",theta=1,eta=0.5)
pgepg(x,"exp",theta=1,eta=0.5)
qgepg(x,"exp",theta=1,eta=0.5)
rgepg(10,"exp",theta=1,eta=0.5)
mgepg("exp",rexp(100),starts=c(1,0.5,1),method="BFGS")


