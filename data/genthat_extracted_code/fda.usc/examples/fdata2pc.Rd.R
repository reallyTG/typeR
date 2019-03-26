library(fda.usc)


### Name: fdata2pc
### Title: Principal components for functional data
### Aliases: fdata2pc fdata2ppc
### Keywords: multivariate

### ** Examples

 ## Not run: 
##D  n= 100;tt= seq(0,1,len=51)
##D  x0<-rproc2fdata(n,tt,sigma="wiener")
##D  x1<-rproc2fdata(n,tt,sigma=0.1)
##D  x<-x0*3+x1
##D  pc=fdata2ppc(x,lambda=1)
##D  summary(pc)
## End(Not run)



