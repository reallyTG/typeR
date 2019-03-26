library(multipol)


### Name: multipol-package
### Title: Multivariate polynomials
### Aliases: multipol-package
### Keywords: array

### ** Examples


ones(2)*linear(c(1,-1))                             # x^2-y^2
ones(2)*(ones(2,2)-uni(2))                          # x^3+y^3


a <- as.multipol(matrix(1:12,3,4))
a

a[1,1] <- 11

f <- as.function(a*a)

f(c(1,pi))




