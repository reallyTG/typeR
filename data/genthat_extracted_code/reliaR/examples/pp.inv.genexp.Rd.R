library(reliaR)


### Name: pp.inv.genexp
### Title: Probability versus Probability (PP) plot for the Inverse
###   Generalized Exponential(IGE) distribution
### Aliases: pp.inv.genexp
### Keywords: hplot

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(repairtimes)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.097807, lambda.est = 1.206889

pp.inv.genexp(repairtimes, 1.097807, 1.206889, main = " ", line = TRUE)



