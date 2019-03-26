library(reliaR)


### Name: qq.expo.weibull
### Title: Quantile versus quantile (QQ) plot for the Exponentiated
###   Weibull(EW) distribution
### Aliases: qq.expo.weibull
### Keywords: hplot

### ** Examples

## Load data sets
data(stress)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(stress)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est =1.026465, theta.est = 7.824943

qq.expo.weibull(stress, 1.026465, 7.824943, main = " ", line.qt = FALSE)



