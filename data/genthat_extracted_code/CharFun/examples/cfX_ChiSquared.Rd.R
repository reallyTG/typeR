library(CharFun)


### Name: cfX_ChiSquared
### Title: Characteristic function of Noncentral Chi-Squared distribution
### Aliases: cfX_ChiSquared

### ** Examples

## EXAMPLE1 (CF of the ChiSquared distribution with df = 1)
df <- 1
t <- seq(-50, 50, length.out = 501)
plotGraf(function(t)
  cfX_ChiSquared(t, df), t, title = "CF of the Chi-squared distribution with df = 1")

## EXAMPLE2 (PDF/CDF of the ChiSquared distribution with df = 3)
df <- 3
prob <- c(0.9, 0.95, 0.99)
cf <- function(t)
  cfX_ChiSquared(t, df)
x <- seq(-0, 15, length.out = 101)
result <- cf2DistGP(cf,
                    x,
                    prob,
                    xMin = 0,
                    xMax = 22,
                    N = 2 ^ 14)

## EXAMPLE3 (PDF/CDF of the compound Binomial-ChiSquared distribution)
n <- 25
p <- 0.3
df <- 3
prob <- c(0.9, 0.95, 0.99)
cfX <- function(t)
  cfX_ChiSquared(t, df)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)
x <- seq(-0, 80, length.out = 501)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)

## EXAMPLE4 (CF of the ChiSquared distribution with df = 1, npc = 2)
df <- 1
npc <- 2
t <- seq(-50, 50, length.out = 501)
plotGraf(function(t)
  cfX_ChiSquared(t, df, npc), t, title = "CF of the Chi-squared distribution with df = 1, npc = 2")

## EXAMPLE5 (PDF/CDF of the ChiSquared distribution with df = 3, npc = 2)
df <- 3
npc <- 2
prob <- c(0.9, 0.95, 0.99)
cf <- function(t)
  cfX_ChiSquared(t, df, npc)
x <- seq(-0, 15, length.out = 101)
result <- cf2DistGP(cf, x, prob, N = 2 ^ 14)

## EXAMPLE6 (PDF/CDF of the compound Binomial-ChiSquared distribution)
n <- 25
p <- 0.3
df <- 3
npc <- 2
prob <- c(0.9, 0.95, 0.99)
cfX <- function(t)
  cfX_ChiSquared(t, df, npc)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)
x <- seq(-0, 80, length.out = 501)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)




