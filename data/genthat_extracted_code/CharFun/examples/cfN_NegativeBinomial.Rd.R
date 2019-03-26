library(CharFun)


### Name: cfN_NegativeBinomial
### Title: Characteristic function of Negative-Binomial distribution
### Aliases: cfN_NegativeBinomial

### ** Examples

## EXAMPLE1 (CF of the Negative Binomial distribution with r = 5, p = 0.3)
r <- 5
p <- 0.3
t <- seq(-15, 15, length.out = 1001)
plotGraf(function(t)
  cfN_NegativeBinomial(t, r, p), t,
  title = "CF of the Negative Binomial distribution with r = 5, p = 0.3")

## EXAMPLE2 (PDF/CDF of the compound NegativeBinomial-Exponential distribution)
r <- 5
p <- 0.3
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_NegativeBinomial(t, r, p, cfX)
x <- seq(0, 10, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



