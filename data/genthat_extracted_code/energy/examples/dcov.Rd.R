library(energy)


### Name: distance correlation
### Title: Distance Correlation and Covariance Statistics
### Aliases: dcor dcov DCOR
### Keywords: multivariate

### ** Examples

 x <- iris[1:50, 1:4]
 y <- iris[51:100, 1:4]
 dcov(x, y)
 dcov(dist(x), dist(y))  #same thing

 ## C implementation
 dcov(x, y, 1.5)
 dcor(x, y, 1.5)

 ## R implementation
 DCOR(x, y, 1.5)



