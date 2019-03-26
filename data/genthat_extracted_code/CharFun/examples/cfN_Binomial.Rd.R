library(CharFun)


### Name: cfN_Binomial
### Title: Characteristic function of Binomial distribution
### Aliases: cfN_Binomial

### ** Examples

## EXAMPLE1 (CF of the Binomial distribution with n = 25, p = 0.3)
n <- 25
p <- 0.3
t <- seq(-15, 15, length.out = 1001)
plotGraf(function(t)
  cfN_Binomial(t, n, p), t, title = "CF of the Binomial distribution with n = 25, p = 0.3")

## EXAMPLE2 (CF of the compound Binomial-Exponential distribution)
n <- 25
p <- 0.3
lambda <- 10
cfX <- function(t)
  cfX_Exponential(t, lambda)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Binomial(t, n, p, cfX), t, title = "CF of the compound Binomial-Exponential distribution")

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



