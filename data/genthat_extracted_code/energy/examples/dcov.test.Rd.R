library(energy)


### Name: dcov.test
### Title: Distance Covariance Test and Distance Correlation test
### Aliases: 'distance covariance' dcov.test dcor.test
### Keywords: htest multivariate nonparametric

### ** Examples

 x <- iris[1:50, 1:4]
 y <- iris[51:100, 1:4]
 set.seed(1)
 dcor.test(dist(x), dist(y), R=199)
 set.seed(1)
 dcov.test(x, y, R=199)



