library(CharFun)


### Name: cfS_Trapezoidal
### Title: Characteristic function of Trapezoidal distribution
### Aliases: cfS_Trapezoidal

### ** Examples

## EXAMPLE1 (CF of the Trapezoidal distribution with a = 1, c = 0.5)
t <- seq(-15, 15, length.out = 501)
plotGraf(function(t)
  cfS_Trapezoidal(t, c = 1 / 2), t,
  title = "CF of the Trapezoidal distribution with a = 1, c = 0.5")

## EXAMPLE2 (PDF/CDF of the compound Trapezoidal distribution with a = 1, c = 0.5)
cf <- function(t)
  cfS_Trapezoidal(t, c = 1 / 2)
x <- seq(-1, 1, length.out = 100)
prob <- c(0.9, 0.95, 0.99)
xRange <- 2
option <- list()
option$N <- 1000
option$dx <- 2 / pi / xRange
result <- cf2DistGP(cf, x, option = option)



