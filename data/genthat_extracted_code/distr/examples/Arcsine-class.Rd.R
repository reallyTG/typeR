library(distr)


### Name: Arcsine-class
### Title: Class "Arcsine"
### Aliases: Arcsine-class Arcsine initialize,Arcsine-method
### Keywords: distribution

### ** Examples

A <- Arcsine()
# A is a Arcsine distribution with shape1 = 1 and shape2 = 1.
r(A)(3) # three random number generated from this distribution, e.g. 0.6979795
d(A)(c(-2,-1,-0.2,0,0.2,1,2)) # Density at x=c(-1,-0.2,0,0.2,1).
p(A)(c(-2,-1,-0.2,0,0.2,1,2)) # cdf at q=c(-1,-0.2,0,0.2,1).
q(A)(c(0,0.2,1,2)) # quantile function at at x=c(0,0.2,1).
## in RStudio or Jupyter IRKernel, use q.l(A)(c(0,0.2,1,2)) instead



