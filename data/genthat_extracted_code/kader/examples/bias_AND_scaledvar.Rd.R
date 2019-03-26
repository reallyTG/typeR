library(kader)


### Name: bias_AND_scaledvar
### Title: Estimators of Bias and Scaled Variance
### Aliases: bias_AND_scaledvar

### ** Examples

require(stats)

set.seed(2017);     n <- 100;     Xdata <- sort(rnorm(n))
x0 <- 1;      Sigma <- seq(0.01, 10, length = 21)

h <- n^(-1/5)
Ai <- (x0 - Xdata)/h
fnx0 <- mean(dnorm(Ai)) / h   # Parzen-Rosenblatt estimator at x0.

 # non-robust method:
Bj <- mean(Xdata) - Xdata
# # rank transformation-based method (requires sorted data):
# Bj <- -J_admissible(1:n / n)   # rank trafo

kader:::bias_AND_scaledvar(sigma = Sigma, Ai = Ai, Bj = Bj, h = h,
  K = dnorm, fnx = fnx0, ticker = TRUE)




