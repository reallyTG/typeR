library(elliptic)


### Name: congruence
### Title: Solves mx+by=1 for x and y
### Aliases: congruence
### Keywords: math

### ** Examples

M <- congruence(c(4,9))
det(M)

o <- c(1,1i)
g2.fun(o) - g2.fun(o,maxiter=840)  #should be zero




