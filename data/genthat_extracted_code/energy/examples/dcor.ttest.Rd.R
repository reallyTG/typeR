library(energy)


### Name: dcor.ttest
### Title: Distance Correlation t-Test
### Aliases: dcor.ttest dcor.t
### Keywords: htest multivariate nonparametric

### ** Examples

 x <- matrix(rnorm(100), 10, 10)
 y <- matrix(runif(100), 10, 10)
 dx <- dist(x)
 dy <- dist(y)
 dcor.t(x, y)
 dcor.ttest(x, y)



