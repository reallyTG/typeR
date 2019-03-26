library(highmean)


### Name: apval_Sri2008
### Title: Asymptotics-Based p-value of the Test Proposed by Srivastava and
###   Du (2008)
### Aliases: apval_Sri2008

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
apval_Sri2008(sam1, sam2)



