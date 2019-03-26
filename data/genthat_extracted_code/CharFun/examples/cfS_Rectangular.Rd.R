library(CharFun)


### Name: cfS_Rectangular
### Title: Characteristic function of Rectangular distribution
### Aliases: cfS_Rectangular

### ** Examples

## EXAMPLE1 (CF of the Rectangular distribution on (-1,1))
t <- seq(-50, 50, length.out = 501)
plotGraf(function(t)
  cfS_Rectangular(t), t, title = "CF of the Rectangular distribution on (-1,1)")

## EXAMPLE2 (PDF/CDF of the Rectangular distribution on (-1,1))
cf <- function(t)
  cfS_Rectangular(t)
x <- seq(-2, 2, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
xRange <- 2
option <- list()
option$N <- 2 ^ 10
option$dx <- 2 / pi / xRange
result <- cf2DistGP(cf, x, prob, option)

## EXAMPLE3 (PDF/CDF of the Rectangular distribution on (-1,1))
cf <- function(t)
  cfS_Rectangular(t)
x <- seq(-1, 1, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf,
                    x,
                    prob,
                    xMin = -1,
                    xMax = 1,
                    N = 2)



