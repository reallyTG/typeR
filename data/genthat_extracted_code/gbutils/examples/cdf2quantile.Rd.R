library(gbutils)


### Name: cdf2quantile
### Title: Calculate a quantile from a distribution function
### Aliases: cdf2quantile
### Keywords: distribution

### ** Examples

cdf2quantile(0.95, pnorm)
cdf2quantile(0.05, pexp)   # support [0,Inf) is no problem for
cdf2quantile(0.05, plnorm) # for built-in distributions.

## default predicision is about 4 digits after decimal point
cdf2quantile(0.95, pnorm, mean = 3, sd = 1)
cdf2quantile(0.05, pnorm, mean = 3, sd = 1)
qnorm(c(0.95, 0.05), mean = 3, sd = 1)

## request a higher precision:
cdf2quantile(0.05, pnorm, mean = 3, sd = 1, tol = 1e-8)
cdf2quantile(0.05, pnorm, mean = 3, sd = 1, tol = 1e-12)

## see also examples for plotpdf()



