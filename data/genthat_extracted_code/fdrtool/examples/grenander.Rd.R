library(fdrtool)


### Name: grenader
### Title: Grenander Estimator of a Decreasing or Increasing Density
### Aliases: grenander plot.grenander
### Keywords: univar

### ** Examples

# load "fdrtool" library
library("fdrtool")

# samples from random exponential variable 
z = rexp(30,1)
e = ecdf(z)
g = grenander(e)
g

# plot ecdf, concave cdf, and Grenander density estimator (on log scale)
plot(g, log="y") 

# for comparison the kernel density estimate
plot(density(z)) 

# area under the Grenander density estimator 
sum( g$f.knots[-length(g$f.knots)]*diff(g$x.knots) )



