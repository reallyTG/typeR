library(InspectChangepoint)


### Name: rescale.variance
### Title: Noise standardisation for multivariate time series.
### Aliases: rescale.variance
### Keywords: ~ts

### ** Examples

x <- matrix(rnorm(40),5,8) * (1:5)
x.rescaled <- rescale.variance(x)
x.rescaled



