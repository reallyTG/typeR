library(CharFun)


### Name: cfE_Empirical
### Title: Characteristic function of Empirical distribution
### Aliases: cfE_Empirical

### ** Examples

# EXAMPLE1 (Empirical CF - a weighted mixture of independent Dirac variables)
set.seed(101)
n <- 1000
data <- c(rnorm(3 * n, 5, 0.2), rt(n, 3), rchisq(n, 1))
t <- seq(-50, 50, length.out = 2 ^ 10)
plotGraf(function(t)
  cfE_Empirical(t, data), t, title = "Empirical CF - CF of the mixture of Dirac random variables")

# EXAMPLE2 (Convolution of the ECF and the Gaussian kernel)
set.seed(101)
n <- 1000
data <- c(rnorm(3 * n, 5, 0.2), rt(n, 3), rchisq(n, 1))
bandwidth <- 0.25
cf_DATA   <- function(t)
  cfE_Empirical(t, data)
cf_KERNEL <- function(t)
  exp(-(bandwidth * t) ^ 2 / 2)
cf <- function(t)
  cf_DATA(t) * cf_KERNEL(t)
t <- seq(-50, 50, length.out = 2 ^ 10)
plotGraf(cf, t, title = "Smoothed Empirical CF")
result <- cf2DistGP(cf)

# (PDF/CDF of the compound Empirical-Empirical distribution)
set.seed(101)
lambda <- 25
nN <- 10
Ndata <- rpois(nN, lambda)

mu <- 0.1
sigma <- 2
nX <- 1500
Xdata <- rlnorm(nX, mu, sigma)
cfX <- function(t)
  cfE_Empirical(t, Xdata)
cf  <- function(t)
  cfE_Empirical(t, Ndata, cfX)
t <- seq(-0.2, 0.2, length.out = 2 ^ 10)
plotGraf(cf, t, title = "Compound Empirical CF")

x <- seq(0, 1000, length.out = 501)
prob <- c(0.9, 0.95)
result <- cf2DistGP(cf, x, prob, N = 2 ^ 10, SixSigmaRule = 10)



