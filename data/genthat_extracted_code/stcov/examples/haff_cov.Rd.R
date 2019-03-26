library(stcov)


### Name: haff_cov
### Title: Stein/Haff's covariance estimator
### Aliases: haff_cov

### ** Examples

p <- 5
n <- 10
S <- rWishart(1, n, diag(p))[,,1]
haff_cov(S, n)



