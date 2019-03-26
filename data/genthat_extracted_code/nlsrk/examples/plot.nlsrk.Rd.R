library(nlsrk)


### Name: plot.nlsrk
### Title: Plot of multivariate data fitted by the nlsrk package
### Aliases: plot.nlsrk
### Keywords: multivariate

### ** Examples

##
##	example 1 : solving and plotting the system sys provided in the package
##
data(syslin.don)
syslin<-prepare(syslin.don)
attach(syslin)
nls(y~ evrunge(t,param=c(k1,k2),y0=c(1000,0),sys,graph=FALSE),data=syslin,
	start=list(k1=1,k2=1),trace=TRUE)->m1
plot.nlsrk(m1,syslin)
##




