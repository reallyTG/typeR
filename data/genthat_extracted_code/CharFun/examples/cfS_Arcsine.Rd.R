library(CharFun)


### Name: cfS_Arcsine
### Title: Characteristic function of symmetric zero-mean Arcsine
###   distribution
### Aliases: cfS_Arcsine

### ** Examples

## EXAMPLE1 (CF of the symmetric Arcsine distribution on (-1,1))
t <- seq(-50, 50, length.out = 501)
plotGraf(function(t)
  cfS_Arcsine(t), t, title = "CF of the symmetric Arcsine distribution on (-1,1)")

## EXAMPLE2 (PDF/CDF of the symmetric Arcsine distribution on (-1,1))
cf <- function(t)
  cfS_Arcsine(t)
x <- seq(-1, 1, length.out = 501)
prob <- c(0.9, 0.95, 0.99)
xRange <- 2
N <- 2 ^ 12
option <- list()
option$dt <- 2 * pi / xRange
result <- cf2DistGP(cf, x, prob, option, N = N)



