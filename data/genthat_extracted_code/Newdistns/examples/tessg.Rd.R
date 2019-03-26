library(Newdistns)


### Name: tessg
### Title: Truncated-Exponential Skew-Symmetric G Distribution
### Aliases: dtessg ptessg qtessg rtessg mtessg
### Keywords: Truncated-exponential skew-symmetric G distribution

### ** Examples
x=runif(10,min=0,max=1)
dtessg(x,"exp",lambda=1)
ptessg(x,"exp",lambda=1)
qtessg(x,"exp",lambda=1)
rtessg(10,"exp",lambda=1)
mtessg("exp",rexp(100),starts=c(1,1),method="BFGS")


