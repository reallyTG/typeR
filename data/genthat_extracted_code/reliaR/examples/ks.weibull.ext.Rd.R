library(reliaR)


### Name: ks.weibull.ext
### Title: Test of Kolmogorov-Smirnov for the Weibull Extension(WE)
###   distribution
### Aliases: ks.weibull.ext
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.00019114, beta.est = 0.14696242

ks.weibull.ext(sys2, 0.00019114, 0.14696242, alternative = "two.sided", plot = TRUE)



