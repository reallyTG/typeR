library(highmean)


### Name: apval_Bai1996
### Title: Asymptotics-Based p-value of the Test Proposed by Bai and
###   Saranadasa (1996)
### Aliases: apval_Bai1996

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
apval_Bai1996(sam1, sam2)



