library(codadiags)


### Name: ad.cdf
### Title: Anderson-Darling cumulative density function, copy from
###   ADGofTest package.
### Aliases: ad.cdf

### ** Examples

require(codadiags)
plot(null.lim.cdf("loglik_mean.brownianbridge",forceUseECDF=TRUE),col='blue',xlim=c(-4,0))
plot(Vectorize(function(x)1-ad.cdf(-x)),col='green',add=TRUE,xlim=c(-4,0))



