library(reliaR)


### Name: qq.weibull.ext
### Title: Quantile versus quantile (QQ) plot for the Weibull Extension(WE)
###   distribution
### Aliases: qq.weibull.ext
### Keywords: hplot

### ** Examples

## Load data sets
data(sys2)
## Maximum Likelihood(ML) Estimates of alpha & beta for the data(sys2)
## Estimates of alpha & beta using 'maxLik' package
## alpha.est = 0.00019114, beta.est = 0.14696242

qq.weibull.ext(sys2, 0.00019114, 0.14696242, main = " ", line.qt = FALSE)



