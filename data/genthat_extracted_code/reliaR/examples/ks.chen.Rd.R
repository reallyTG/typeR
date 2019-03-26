library(reliaR)


### Name: ks.chen
### Title: Test of Kolmogorov-Smirnov for the Chen distribution
### Aliases: ks.chen
### Keywords: htest

### ** Examples

## Load data sets
data(sys2)
## Estimates of beta & lambda using 'maxLik' package
## beta.est = 0.262282404, lambda.est = 0.007282371

ks.chen(sys2, 0.262282404, 0.007282371, alternative = "two.sided", plot = TRUE)  



