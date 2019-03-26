library(actuar)


### Name: adjCoef
### Title: Adjustment Coefficient
### Aliases: adjCoef plot.adjCoef
### Keywords: optimize univar

### ** Examples

## Basic example: no reinsurance, exponential claim severity and wait
## times, premium rate computed with expected value principle and
## safety loading of 20%.
adjCoef(mgfexp, premium = 1.2, upper = 1)

## Same thing, giving function h.
h <- function(x) 1/((1 - x) * (1 + 1.2 * x))
adjCoef(h = h, upper = 1)

## Example 11.4 of Klugman et al. (2008)
mgfx <- function(x) 0.6 * exp(x) + 0.4 * exp(2 * x)
adjCoef(mgfx(x), mgfexp(x, 4), prem = 7, upper = 0.3182)

## Proportional reinsurance, same assumptions as above, reinsurer's
## safety loading of 30%.
mgfx <- function(x, y) mgfexp(x * y)
p <- function(x) 1.3 * x - 0.1
h <- function(x, a) 1/((1 - a * x) * (1 + x * p(a)))
R1 <- adjCoef(mgfx, premium = p, upper = 1, reins = "proportional",
              from = 0, to = 1, n = 11)
R2 <- adjCoef(h = h, upper = 1, reins = "p",
             from = 0, to = 1, n = 101)
R1(seq(0, 1, length = 10))	# evaluation for various retention rates
R2(seq(0, 1, length = 10))	# same
plot(R1)		        # graphical representation
plot(R2, col = "green", add = TRUE) # smoother function

## Excess-of-loss reinsurance
p <- function(x) 1.3 * levgamma(x, 2, 2) - 0.1
mgfx <- function(x, l)
    mgfgamma(x, 2, 2) * pgamma(l, 2, 2 - x) +
    exp(x * l) * pgamma(l, 2, 2, lower = FALSE)
h <- function(x, l) mgfx(x, l) * mgfexp(-x * p(l))
R1 <- adjCoef(mgfx, upper = 1, premium = p, reins = "excess-of-loss",
             from = 0, to = 10, n = 11)
R2 <- adjCoef(h = h, upper = 1, reins = "e",
             from = 0, to = 10, n = 101)
plot(R1)
plot(R2, col = "green", add = TRUE)



