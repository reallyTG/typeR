library(DepthProc)


### Name: depth
### Title: Depth calculation
### Aliases: depth
### Keywords: depth function multivariate nonparametric robust

### ** Examples

library(robustbase)

# Calculation of Projection depth
data(starsCYG, package = "robustbase")
depth(t(colMeans(starsCYG)), starsCYG)

# Also for matrices
depth(starsCYG, starsCYG)

# Projection depth applied to a large bivariate data set
x <- matrix(rnorm(9999), nc = 3)
depth(x, x)




