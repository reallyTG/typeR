library(cglasso)


### Name: rdatacggm
### Title: Simulate from a Censored Gaussian Graphical Model
### Aliases: rdatacggm
### Keywords: distribution datagen multivariate

### ** Examples

set.seed(123)

n <- 1000L
p <- 3L
mu <- rep(1L, p)
rho <- 0.3
Sigma <- outer(1L:p, 1L:p, function(i, j) rho^abs(i - j))

# simulating a dataset from a left-censored Gaussian graphical model
X <- rdatacggm(n = n, mu = mu, Sigma = diag(p), probl = 0.05)
# the same: X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, probl = 0.05, probr = 0)
# the same: X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, probl = 0.05, up = +Inf)
summary(X)

# simulating a dataset from a right-censored Gaussian graphical model
X <- rdatacggm(n = n, mu = mu, Sigma = diag(p), probr = 0.05)
# the same: X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, probr = 0.05, probl = 0)
# the same: X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, probr = 0.05, lo = -Inf)
summary(X)

# simulating a dataset from a censored Gaussian graphical model
X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, probr = 0.05, probl = 0.05)
summary(X)

# simulating a full observed dataset: a warning is produced
X <- rdatacggm(n = n, mu = mu, Sigma = Sigma, lo = -10, up = 10)
summary(X)



