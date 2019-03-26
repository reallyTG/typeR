library(plsdof)


### Name: kernel.pls.fit
### Title: Kernel Partial Least Squares Fit
### Aliases: kernel.pls.fit
### Keywords: multivariate

### ** Examples

n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)


pls.object<-kernel.pls.fit(X,y,m=5,compute.jacobian=TRUE)





