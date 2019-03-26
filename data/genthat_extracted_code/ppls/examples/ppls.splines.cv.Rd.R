library(ppls)


### Name: ppls.splines.cv
### Title: Cross-validation for penalized PLS based on Spline
###   Transformations
### Aliases: ppls.splines.cv
### Keywords: multivariate

### ** Examples

# this example does not make much sense, it only illustrates
# how to use the functions properly

X<-matrix(rnorm(100*5),ncol=5)
y<-sin(X[,1]) +X[,2]^2 + rnorm(100)
lambda<-c(0,1,10,100,1000)
cv.result<-ppls.splines.cv(X,y,ncomp=10,k=10,lambda=lambda)



