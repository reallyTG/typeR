library(CharFun)


### Name: cfX_Normal
### Title: Characteristic function of Normal distribution
### Aliases: cfX_Normal

### ** Examples

## EXAMPLE1 (CF of the Normal distribution N(1,1))
t <- seq(-5, 5, length.out = 501)
plotGraf(function(t)
  cfX_Normal(t, mean = 1, variance = 1), t, title = "CF of the Normal distribution N(1,1)")

## EXAMPLE2 (PDF/CDF of the Normal distribution N(1,1))
cf <- function(t)
  cfX_Normal(t, mean = 1, variance = 1)
x <- seq(-4, 4, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, N = 2 ^ 5, SixSigmaRule = 8)



