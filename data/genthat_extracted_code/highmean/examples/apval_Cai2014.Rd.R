library(highmean)


### Name: apval_Cai2014
### Title: Asymptotics-Based p-value of the Test Proposed by Cai et al
###   (2014)
### Aliases: apval_Cai2014

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
apval_Cai2014(sam1, sam2)

# the two sample populations have different covariances
true.cov1 <- 0.2^(abs(outer(1:p, 1:p, "-")))
true.cov2 <- 0.6^(abs(outer(1:p, 1:p, "-")))
sam1 <- mvrnorm(n = n1, mu = mu1, Sigma = true.cov1)
sam2 <- mvrnorm(n = n2, mu = mu2, Sigma = true.cov2)
apval_Cai2014(sam1, sam2, eq.cov = FALSE)



