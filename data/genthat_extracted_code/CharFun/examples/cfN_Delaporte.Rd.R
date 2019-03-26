library(CharFun)


### Name: cfN_Delaporte
### Title: Characteristic function of Delaporte distribution
### Aliases: cfN_Delaporte

### ** Examples

## EXAMPLE1 (CF of the Delaporte distribution with a = 2.2, b = 3.3, c = 4)
a <- 2.2
b <- 3.3
c <- 4
t <- seq(-15, 15, length.out = 1001)
plotGraf(function(t)
  cfN_Delaporte(t, a, b, c), t, title = "CF of the Delaporte distribution with a=2.2, b=3.3, c=4")

## EXAMPLE2 (CF of the compound Delaport-Exponential distribution)
a <- 2.2
b <- 3.3
c <- 4
lambda <- 10
cfX <- function(t)
  cfX_Exponential(t, lambda)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Delaporte(t, a, b, c, cfX), t, title = "CF of the compound Delaport-Exponential distribution")

## EXAMPLE3 (PDF/CDF of the compound Delaport-Exponential distribution)
a <- 2.2
b <- 3.3
c <- 4
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_Delaporte(t, a, b, c, cfX)
x <- seq(0, 4, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



