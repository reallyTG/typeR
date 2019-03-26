library(c060)


### Name: Plot.coef.glmnet
### Title: function to highlight the path of a pre-specified set of
###   variables within the coefficient path
### Aliases: Plot.coef.glmnet
### Keywords: coefficient path

### ** Examples

## Not run: 
##D set.seed(1010)
##D n=1000;p=100
##D nzc=trunc(p/10)
##D x=matrix(rnorm(n*p),n,p)
##D beta=rnorm(nzc)
##D fx= x[,seq(nzc)] %*% beta
##D eps=rnorm(n)*5
##D y=drop(fx+eps)
##D px=exp(fx)
##D px=px/(1+px)
##D ly=rbinom(n=length(px),prob=px,size=1)
##D set.seed(1011)
##D cvob1=cv.glmnet(x,y)
##D Plot.coef.glmnet(cvob1, c("V1","V100"))
## End(Not run)


