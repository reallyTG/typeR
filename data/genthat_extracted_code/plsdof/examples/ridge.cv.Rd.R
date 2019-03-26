library(plsdof)


### Name: ridge.cv
### Title: Ridge Regression.
### Aliases: ridge.cv
### Keywords: multivariate

### ** Examples

n<-100 # number of observations
p<-60 # number of variables
X<-matrix(rnorm(n*p),ncol=p) 
y<-rnorm(n)
ridge.object<-ridge.cv(X,y)



