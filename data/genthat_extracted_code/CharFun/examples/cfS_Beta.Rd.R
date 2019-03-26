library(CharFun)


### Name: cfS_Beta
### Title: Characteristic function of Beta distribution
### Aliases: cfS_Beta

### ** Examples

## EXAMPLE1 (CF of the Beta distribution with alpha = 1/2, beta = 3/2)
alpha <- 1 / 2
beta <- 3 / 2
t <- seq(-50, 50, length.out = 501)
plotGraf(function(t)
  cfX_Beta(t, alpha, beta), t, title = "CF of the Beta distribution with alpha = 1/2, beta = 3/2")

## EXAMPLE2 (PDF/CDF of the Beta distribution with alpha = 1/2, beta = 3/2)
alpha <- 1 / 2
beta <- 3 / 2
cf <- function(t)
  cfX_Beta(t, alpha, beta)
x <- seq(0, 1, length.out = 101)
xRange <- 1
option <- list()
option$dx <- 2 * pi / xRange
result <- cf2DistGP(cf, x, option = option)



