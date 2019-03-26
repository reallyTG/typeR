library(CharFun)


### Name: cfN_Geometric
### Title: Characteristic function of Geometric distribution
### Aliases: cfN_Geometric

### ** Examples

## EXAMPLE1 (CF of the Geometric distribution with the parameter p = 0.5)
p <- 0.5
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Geometric(t, p), t,
  title = "CF of the Geometric distribution with the parameter p = 0.5")

## EXAMPLE2 (CF of the Geometric distribution with the parameter p = 0.5, type = "shifted")
p <- 0.5
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Geometric(t, p, "shifted"), t,
  title = "CF of the Geometric distribution with the parameter p = 0.5")

## EXAMPLE3 (CF of the compound Geometric-Exponential distribution)
p <- 0.5
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Geometric(t, p, 1, cfX), t,
  title = "CF of the compound Geometric-Exponential distribution")

## EXAMPLE4 (PDF/CDF of the compound Geometric-Exponential distribution)
p <- 0.5
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_Geometric(t, p, cfX = cfX)
x <- seq(0, 4, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



