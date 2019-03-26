library(CharFun)


### Name: cfX_Exponential
### Title: Characteristic function of Exponential distribution
### Aliases: cfX_Exponential

### ** Examples

## EXAMPLE1 (CF of the Exponential distribution with lambda = 5)
lambda <- 5
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfX_Exponential(t, lambda), t, title = "CF of the Exponential distribution with lambda = 5")

## EXAMPLE2 (PDF/CDF of the Exponential distribution with lambda = 5)
lambda <- 5
cf <- function(t)
  cfX_Exponential(t, lambda)
x <- seq(0, 1.5, length.out = 501)
result <- cf2DistGP(cf, x, SixSigmaRule = 8, xMin = 0)

## EXAMPLE3 (PDF/CDF of the compound Binomial-Exponential distribution)
n <- 25
p <- 0.3
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)
x <- seq(0, 5, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



