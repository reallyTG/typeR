library(plsdof)


### Name: linear.pls
### Title: Linear Partial Least Squares Fit
### Aliases: linear.pls.fit
### Keywords: multivariate

### ** Examples

n<-50 # number of observations
p<-5 # number of variables
X<-matrix(rnorm(n*p),ncol=p)
y<-rnorm(n)


pls.object<-linear.pls.fit(X,y,m=5,compute.jacobian=TRUE)





