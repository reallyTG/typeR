library(reliaR)


### Name: qq.inv.genexp
### Title: Quantile versus quantile (QQ) plot for the Inverse Generalized
###   Exponential(IGE) distribution
### Aliases: qq.inv.genexp
### Keywords: hplot

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(repairtimes)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.097807, lambda.est = 1.206889

qq.inv.genexp(repairtimes, 1.097807, 1.206889, main = " ", line.qt = FALSE)



