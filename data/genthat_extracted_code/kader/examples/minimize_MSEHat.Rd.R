library(kader)


### Name: minimize_MSEHat
### Title: Minimization of Estimated MSE
### Aliases: minimize_MSEHat

### ** Examples

require(stats)

set.seed(2017);     n <- 100;     Xdata <- sort(rnorm(n))
x0 <- 1;      Sigma <- seq(0.01, 10, length = 11)

h <- n^(-1/5)
Ai <- (x0 - Xdata)/h
fnx0 <- mean(dnorm(Ai)) / h   # Parzen-Rosenblatt estimator at x0.

 # For non-robust method:
Bj <- mean(Xdata) - Xdata
#  # For rank transformation-based method (requires sorted data):
# Bj <- -J_admissible(1:n / n)   # rank trafo

BV <- kader:::bias_AND_scaledvar(sigma = Sigma, Ai = Ai, Bj = Bj,
  h = h, K = dnorm, fnx = fnx0, ticker = TRUE)

kader:::minimize_MSEHat(VarHat.scaled = BV$VarHat.scaled,
  BiasHat.squared = (BV$BiasHat)^2, sigma = Sigma, Ai = Ai, Bj = Bj,
  h = h, K = dnorm, fnx = fnx0, ticker = TRUE, plot = FALSE)




