library(fmlogcondens)


### Name: fmlcd
### Title: Estimates a Log-Concave Density
### Aliases: fmlcd

### ** Examples

# draw samples from normal distribution
X <- matrix(rnorm(200),100,2) 
# calculate parameters of convex hull of X
r <- calcCvxHullFaces(X)
# draw random parameters of 10 hyperplanes
a <- matrix(runif(10*2),10,2)
b <- runif(10)

# calculate parameters of convex hull of X
params <- correctIntegral(X,rep(0,2),a,b,r$cvh)



