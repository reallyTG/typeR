library(Wrapped)


### Name: wrappedg
### Title: Wrapped G Distribution
### Aliases: dwrappedg pwrappedg qwrappedg rwrappedg mwrappedg plotfour
### Keywords: Wrapped G distribution

### ** Examples
x=runif(10,min=-1,max=1)
dwrappedg(x,"norm",mean=1,sd=1,K=1000)
pwrappedg(x,"norm",mean=1,sd=1,K=1000)
qwrappedg(runif(10,min=0,max=1),"norm",mean=1,sd=1,K=1000)
rwrappedg(10,"norm",mean=1,sd=1)
mwrappedg("norm",runif(100,min=-1,max=1),starts=c(1,1),K=10,method="BFGS")
plotfour("norm",K=100,para=list(c(0,0.1),c(0,2),c(0,5),c(0,20)),
plotit="pdf")


