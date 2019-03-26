library(CharFun)


### Name: cfN_GeneralizedPoisson
### Title: Characteristic function of Generalized Poisson distribution
### Aliases: cfN_GeneralizedPoisson

### ** Examples

## EXAMPLE1 (CF of the Generalized-Poisson distribution with a = 10, p = 0.5)
a <- 10
p <- 0.5
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_GeneralizedPoisson(t, a, p), t,
  title = "CF of the Generalized-Poisson distribution with a = 10, p = 0.5")

## EXAMPLE2 (CF of the compound Generalized-Poisson-Exponential distribution)
a <- 10
p <- 0.5
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_GeneralizedPoisson(t, a, p, cfX), t,
  title = "CF of the compound Generalized-Poisson-Exponential distribution")

## EXAMPLE3 (PDF/CDF of the compound Generalized-Poisson-Exponential distribution)
a <- 10
p <- 0.5
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_GeneralizedPoisson(t, a, p, cfX)
x <- seq(0, 15, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



