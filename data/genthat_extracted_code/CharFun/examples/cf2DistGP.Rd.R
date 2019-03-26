library(CharFun)


### Name: cf2DistGP
### Title: Evaluating CDF/PDF/QF from CF of a continous distribution F by
###   using the Gil-Pelaez inversion formulae.
### Aliases: cf2DistGP

### ** Examples

## EXAMPLE1 (Calculate CDF/PDF of N(0,1) by inverting its CF)
cf <- function(t)
  exp(-t ^ 2 / 2)
result <- cf2DistGP(cf)

## EXAMPLE2 (PDF/CDF of the compound Binomial-Exponential distribution)
n <- 25
p <- 0.3
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)
x <- seq(0, 5, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)

## EXAMPLE3 (PDF/CDF of the compound Poisson-Exponential distribution)
lambda1 <- 10
lambda2 <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda2)
cf <- function(t)
  cfN_Poisson(t, lambda1, cfX)
x <- seq(0, 8, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)



