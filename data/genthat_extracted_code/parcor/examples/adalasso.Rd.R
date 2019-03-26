library(parcor)


### Name: adalasso
### Title: Adaptive Lasso
### Aliases: adalasso
### Keywords: multivariate

### ** Examples

n<-100 # number of observations
p<-60 # number of variables
X<-matrix(rnorm(n*p),ncol=p) 
y<-rnorm(n)
ada.object<-adalasso(X,y,k=10)



