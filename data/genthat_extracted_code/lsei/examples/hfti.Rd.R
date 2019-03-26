library(lsei)


### Name: hfti
### Title: Least Squares Solution using Householder Transformation
### Aliases: hfti
### Keywords: array algebra

### ** Examples

a = matrix(rnorm(10*4), nrow=10)
b = a %*% c(0,1,-1,1) + rnorm(10)
hfti(a, b)



