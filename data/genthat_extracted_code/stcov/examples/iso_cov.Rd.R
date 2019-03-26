library(stcov)


### Name: iso_cov
### Title: Stein's isotonized covariance estimator
### Aliases: iso_cov

### ** Examples

p <- 5
n <- 10
S <- rWishart(1, n, diag(p))[,,1]
iso_cov(S, n)



