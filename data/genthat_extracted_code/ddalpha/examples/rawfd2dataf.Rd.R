library(ddalpha)


### Name: rawfd2dataf
### Title: Transform Raw Functional Data to a 'dataf' Object
### Aliases: rawfd2dataf
### Keywords: functional

### ** Examples

## transform a matrix into a functional data set
n = 5
d = 21
X = matrix(rnorm(n*d),ncol=d)
rawfd2dataf(X,range=c(0,1))

## transform an array into a multivariate functional data set
k = 3
X = array(rnorm(n*d*k),dim=c(n,d,k))
rawfd2dataf(X,range=c(-1,1))




