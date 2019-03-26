library(madness)


### Name: vcov.madness
### Title: Calculate Variance-Covariance Matrix for a model.
### Aliases: vcov.madness

### ** Examples

y <- array(rnorm(2*3),dim=c(2,3))
dy <- matrix(rnorm(length(y)*2),ncol=2)
dx <- crossprod(matrix(rnorm(ncol(dy)*100),nrow=100))
obj <- madness(val=y,dvdx=dy,varx=dx)
print(vcov(obj))




