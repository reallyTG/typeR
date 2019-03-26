library(fda.usc)


### Name: summary.fdata.comp
### Title: Correlation for functional data by Principal Component Analysis
### Aliases: summary.fdata.comp
### Keywords: multivariate

### ** Examples

## Not run 
# n= 200;tt= seq(0,1,len=101)
# x0<-rproc2fdata(n,tt,sigma="wiener")
# x1<-rproc2fdata(n,tt,sigma=0.1)
# x<-x0*3+x1
# beta = tt*sin(2*pi*tt)^2
# fbeta = fdata(beta,tt)
# y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)
# pc1=fdata2pc(x)
# summary(pc1,y)
# pls1=fdata2pls(x,y)
# summary(pls1,cor=TRUE)




