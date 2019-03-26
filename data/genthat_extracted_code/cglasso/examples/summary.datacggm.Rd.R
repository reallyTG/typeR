library(cglasso)


### Name: summary.datacggm
### Title: Summarizing Objects of Class "cggmdata"
### Aliases: summary.datacggm
### Keywords: datagen multivariate

### ** Examples

set.seed(123)
library("cglasso")

n <- 1000L
p <- 3L
mu <- rep(1L, p)
rho <- 0.3
Sigma <- outer(1:p, 1:p, function(i, j) rho^abs(i - j))
X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, probr = 0.05, probl = 0.05)
summary(X)



