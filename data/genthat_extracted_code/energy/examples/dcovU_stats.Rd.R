library(energy)


### Name: dcovU_stats
### Title: Unbiased distance covariance statistics
### Aliases: dcovU_stats
### Keywords: multivariate nonparametric

### ** Examples

 x <- iris[1:50, 1:4]
 y <- iris[51:100, 1:4]
 Dx <- as.matrix(dist(x))
 Dy <- as.matrix(dist(y))
 dcovU_stats(Dx, Dy)
 


