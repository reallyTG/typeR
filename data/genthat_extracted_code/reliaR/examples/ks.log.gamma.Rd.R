library(reliaR)


### Name: ks.log.gamma
### Title: Test of Kolmogorov-Smirnov for the log-gamma(LG) distribution
### Aliases: ks.log.gamma
### Keywords: htest

### ** Examples

## Load data sets
data(conductors)
## Maximum Likelihood(ML) Estimates of alpha & lambda for the data(conductors)
## Estimates of alpha & lambda using 'maxLik' package
## alpha.est = 0.0088741, lambda.est = 0.6059935

ks.log.gamma(conductors, 0.0088741, 0.6059935, alternative = "two.sided", plot = TRUE)



