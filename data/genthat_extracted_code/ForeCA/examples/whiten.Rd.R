library(ForeCA)


### Name: whiten
### Title: whitens multivariate data
### Aliases: check_whitened sqrt_matrix whiten
### Keywords: manip math

### ** Examples


XX <- matrix(rnorm(100), ncol = 2) %*% matrix(runif(4), ncol = 2)
cov(XX)
UU <- whiten(XX)$U
cov(UU)



