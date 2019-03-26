library(CharFun)


### Name: cfN_Poisson
### Title: Characteristic function of Poisson distribution
### Aliases: cfN_Poisson

### ** Examples

## EXAMPLE1 (CF of the Poisson distribution with the parameter lambda = 10)
lambda <- 10
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Poisson(t, lambda), t,
  title = "CF of the Poisson distribution with the parameter lambda = 10")

#' ## EXAMPLE2 (CF of the compound Poisson-Exponential distributionn)
lambda1 <- 10
lambda2 <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda2)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Poisson(t, lambda1, cfX), t,
  title = "CF of the compound Poisson-Exponential distribution")

## EXAMPLE3 (PDF/CDF of the compound Poisson-Exponential distribution)
lambda1 <- 10
lambda2 <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda2)
cf <- function(t)
  cfN_Poisson(t, lambda1, cfX)
x <- seq(0, 8, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



