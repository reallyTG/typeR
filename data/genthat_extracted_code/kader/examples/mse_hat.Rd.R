library(kader)


### Name: mse_hat
### Title: MSE Estimator
### Aliases: mse_hat

### ** Examples

require(stats)

set.seed(2017);     n <- 100;     Xdata <- sort(rnorm(n))
x0 <- 1;      Sigma <- seq(0.01, 10, length = 11)

h <- n^(-1/5)
Ai <- (x0 - Xdata)/h
fnx0 <- mean(dnorm(Ai)) / h   # Parzen-Rosenblatt estimator at x0.

 # non-robust method:
theta.X <- mean(Xdata) - Xdata
kader:::mse_hat(sigma = Sigma, Ai = Ai, Bj = theta.X,
  h = h, K = dnorm, fnx = fnx0, ticker = TRUE)

 # rank transformation-based method (requires sorted data):
negJ <- -J_admissible(1:n / n)   # rank trafo
kader:::mse_hat(sigma = Sigma, Ai = Ai, Bj = negJ,
  h = h, K = dnorm, fnx = fnx0, ticker = TRUE)




