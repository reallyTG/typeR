library(fda.usc)


### Name: cond.mode
### Title: Conditional mode
### Aliases: cond.mode
### Keywords: distribution

### ** Examples

## Not run: 
##D n= 500
##D t= seq(0,1,len=101)
##D beta = t*sin(2*pi*t)^2
##D x = matrix(NA, ncol=101, nrow=n)
##D y=numeric(n)
##D x0<-rproc2fdata(n,seq(0,1,len=101),sigma="wiener")
##D x1<-rproc2fdata(n,seq(0,1,len=101),sigma=0.1)
##D x<-x0*3+x1
##D fbeta = fdata(beta,t)
##D y<-inprod.fdata(x,fbeta)+rnorm(n,sd=0.1)
##D prx=x[1:100];pry=y[1:100]
##D ind=101;ind2=101:110
##D pr0=x[ind];pr10=x[ind2]
##D ndist=161
##D gridy=seq(-1.598069,1.598069, len=ndist)
##D # Conditional Function
##D I=5
##D # Time consuming
##D res = cond.F(pr10[I], gridy, prx, pry, h=1)
##D mcond=cond.mode(res)
##D mcond2=cond.mode(res,method="diff")
## End(Not run)





