library(Newdistns)


### Name: beg
### Title: Beta Extended G Distribution
### Aliases: dbeg pbeg qbeg rbeg mbeg
### Keywords: Beta extended G distribution

### ** Examples
x=runif(10,min=0,max=1)
dbeg(x,"exp",alpha=1,a=1,b=1)
pbeg(x,"exp",alpha=1,a=1,b=1)
qbeg(x,"exp",alpha=1,a=1,b=1)
rbeg(10,"exp",alpha=1,a=1,b=1)
mbeg("exp",rexp(100),starts=c(1,1,1,1),method="BFGS")


