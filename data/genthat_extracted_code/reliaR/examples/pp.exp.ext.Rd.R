library(reliaR)


### Name: pp.exp.ext
### Title: Probability versus Probability (PP) plot for the Exponential
###   Extension(EE) distribution
### Aliases: pp.exp.ext
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(sys2)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 1.0126e+01, lambda.est = 1.5848e-04

pp.exp.ext(sys2, 1.0126e+01, 1.5848e-04, main = " ", line = TRUE)



