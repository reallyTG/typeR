library(highmean)


### Name: cpval_aSPU
### Title: Permutation-And-Asymptotics-Based p-values of the SPU and aSPU
###   Tests
### Aliases: cpval_aSPU

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
cpval_aSPU(sam1, sam2, n.iter = 100)



