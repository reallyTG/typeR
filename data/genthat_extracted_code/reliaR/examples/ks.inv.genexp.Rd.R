library(reliaR)


### Name: ks.inv.genexp
### Title: Test of Kolmogorov-Smirnov for the Inverse Generalized
###   Exponential(IGE) distribution
### Aliases: ks.inv.genexp
### Keywords: htest

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(repairtimes)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.097807, lambda.est = 1.206889

ks.inv.genexp(repairtimes, 1.097807, 1.206889, alternative = "two.sided", plot = TRUE)



