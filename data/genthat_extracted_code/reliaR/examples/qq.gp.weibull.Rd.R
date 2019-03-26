library(reliaR)


### Name: qq.gp.weibull
### Title: Quantile versus quantile (QQ) plot for the generalized power
###   Weibull(GPW) distribution
### Aliases: qq.gp.weibull
### Keywords: hplot

### ** Examples

## Load data sets
data(repairtimes)
## Maximum Likelihood(ML) Estimates of alpha & theta for the data(repairtimes)
## Estimates of alpha & theta using 'maxLik' package
## alpha.est = 1.566093, theta.est = 0.355321

qq.gp.weibull(repairtimes, 1.566093, 0.355321, main = " ", line.qt = FALSE)



