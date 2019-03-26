library(reliaR)


### Name: qq.exp.ext
### Title: Quantile versus quantile (QQ) plot for the Exponential
###   Extension(EE) distribution
### Aliases: qq.exp.ext
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.0126e+01, lambda.est = 1.5848e-04

qq.exp.ext(sys2, 1.0126e+01, 1.5848e-04, main = " ", line.qt = FALSE)



