library(highmean)


### Name: apval_aSPU
### Title: Asymptotics-Based p-values of the SPU and aSPU Tests
### Aliases: apval_aSPU

### ** Examples

library(MASS)
set.seed(1234)
n1 <- n2 <- 50
p <- 200
mu1 <- rep(0, p)
mu2 <- mu1
mu2[1:10] <- 0.2
true.cov <- 0.4^(abs(outer(1:p, 1:p, "-"))) # AR1 covariance
sam1 <- mvrnorm(n = n1, mu = mu1, Sigma = true.cov)
sam2 <- mvrnorm(n = n2, mu = mu2, Sigma = true.cov)
# use true covariance matrix
apval_aSPU(sam1, sam2, cov.est = true.cov)
# fix bandwidth as 10
apval_aSPU(sam1, sam2, bandwidth = 10)
# use the optimal bandwidth from a candidate set
#apval_aSPU(sam1, sam2, bandwidth = 0:20)

# the two sample populations have different covariances
#true.cov1 <- 0.2^(abs(outer(1:p, 1:p, "-")))
#true.cov2 <- 0.6^(abs(outer(1:p, 1:p, "-")))
#sam1 <- mvrnorm(n = n1, mu = mu1, Sigma = true.cov1)
#sam2 <- mvrnorm(n = n2, mu = mu2, Sigma = true.cov2)
#apval_aSPU(sam1, sam2, eq.cov = FALSE,
#	bandwidth1 = 10, bandwidth2 = 10)



