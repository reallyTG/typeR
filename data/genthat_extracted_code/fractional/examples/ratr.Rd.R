library(fractional)


### Name: rat
### Title: Calculate Rational Approximation Using Continued Fraction
###   Methods
### Aliases: .ratr rat ratr

### ** Examples

fractional(base::pi)
ratr(base::pi)

set.seed(123)
(u <- matrix(runif(10), 2, 5))
(ru <- ratr(u, eps = 1.0e-3, maxConv = 6))
(abs_error <- matrix(abs(u - ru[, 1]/ru[, 2]), 2, 5))




