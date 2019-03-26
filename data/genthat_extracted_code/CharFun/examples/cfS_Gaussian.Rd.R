library(CharFun)


### Name: cfS_Gaussian
### Title: Characteristic function of Normal distribution N(0,1)
### Aliases: cfS_Gaussian

### ** Examples

## EXAMPLE1 (CF of the Gaussian distribution N(0,1))
t <- seq(-5, 5, length.out = 501)
plotGraf(function(t)
  cfS_Gaussian(t), t, title = "CF of the Gaussian distribution N(0,1)")

## EXAMPLE2 (PDF/CDF of the Gaussian distribution N(0,1))
cf <- function(t)
  cfS_Gaussian(t)
x <- seq(-4, 4, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, N = 2 ^ 5, SixSigmaRule = 8)



