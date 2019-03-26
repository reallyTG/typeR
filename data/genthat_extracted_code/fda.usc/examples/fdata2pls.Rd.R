library(fda.usc)


### Name: fdata2pls
### Title: Partial least squares components for functional data.
### Aliases: fdata2pls fdata2ppls
### Keywords: multivariate

### ** Examples

## Not run: 
##D n= 500;tt= seq(0,1,len=101)
##D x0<-rproc2fdata(n,tt,sigma="wiener")
##D x1<-rproc2fdata(n,tt,sigma=0.1)
##D x<-x0*3+x1
##D beta = tt*sin(2*pi*tt)^2
##D fbeta = fdata(beta,tt)
##D y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)
##D pls1=fdata2pls(x,y)
##D norm.fdata(pls1$rotation)
## End(Not run)



