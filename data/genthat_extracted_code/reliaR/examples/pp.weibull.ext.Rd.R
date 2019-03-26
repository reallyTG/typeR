library(reliaR)


### Name: pp.weibull.ext
### Title: Probability versus Probability (PP) plot for the Weibull
###   Extension(WE) distribution
### Aliases: pp.weibull.ext
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.00019114, beta.est = 0.14696242

pp.weibull.ext(sys2, 0.00019114, 0.14696242, main = " ", line = TRUE)



