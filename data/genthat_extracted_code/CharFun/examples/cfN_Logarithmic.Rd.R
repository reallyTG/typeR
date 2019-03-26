library(CharFun)


### Name: cfN_Logarithmic
### Title: Characteristic function of Logarithmic distribution
### Aliases: cfN_Logarithmic

### ** Examples

## EXAMPLE1 (CF of the Logarithmic distribution with the parameter p = 0.5)
p <- 0.5
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Logarithmic(t, p), t, title = "CF of the Logarithmic distribution with the parameter p = 0.5")

#' ## EXAMPLE2 (CF of the compound Logarithmic-Exponential distributionn)
p <- 0.5
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Logarithmic(t, p, cfX), t, title = "CF of the compound Logarithmic-Exponential distribution")

## EXAMPLE3 (PDF/CDF of the compound Logarithmic-Exponential distribution)
p <- 0.5
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_Logarithmic(t, p, cfX)
x <- seq(0, 3, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



