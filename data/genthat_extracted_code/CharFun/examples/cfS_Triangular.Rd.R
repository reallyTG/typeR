library(CharFun)


### Name: cfS_Triangular
### Title: Characteristic function of Triangular distribution
### Aliases: cfS_Triangular

### ** Examples

## EXAMPLE1 (CF of the symmetric Triangular distribution on (-2 , 2))
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfS_Triangular(t, 2), t, title = "CF of the symmetric Triangular distribution on (-2 , 2)")

## EXAMPLE2 (PDF/CDF of the symmetric Triangular distribution on (-3 , 3))
cf <- function(t)
  cfS_Triangular(t, 3)
x <- seq(-3, 3, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
xRange <- 6
option <- list()
option$N <- 2 ^ 10
option$dx <- 2 / pi / xRange
result <- cf2DistGP(cf, x, option = option)



