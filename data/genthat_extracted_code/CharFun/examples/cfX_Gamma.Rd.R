library(CharFun)


### Name: cfX_Gamma
### Title: Characteristic function of Gamma distribution
### Aliases: cfX_Gamma

### ** Examples

## EXAMPLE1 (CF of the Gamma distribution with alpha = 2, beta = 2)
alpha <- 2
beta <- 2
t <- seq(-20, 20, length.out = 501)
plotGraf(function(t)
  cfX_Gamma(t, alpha, beta), t, title = "CF of the Gamma distribution with alpha = 2, beta = 2")

## EXAMPLE2 (PDF/CDF of the Gamma distribution with alpha = 2, beta = 2)
alpha <- 2
beta <- 2
cf <- function(t)
  cfX_Gamma(t, alpha, beta)
x <- seq(0, 5, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, xMin = 0, N = 2 ^ 14)

## EXAMPLE3 (PDF/CDF of the compound Binomial-Gamma distribution)
p <- 0.3
n <- 25
alpha <- 2
beta <- 2
cfX <- function(t)
  cfX_Gamma(t, alpha, beta)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)
x <- seq(0, 25, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



