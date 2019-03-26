library(codadiags)


### Name: ks.cdf
### Title: Kolmogorov-Smirnov cumulative density function, copy from
###   stats::ks.test.
### Aliases: ks.cdf

### ** Examples

require(codadiags)
plot(null.lim.cdf("extremum.brownianbridge",forceUseECDF=TRUE),col='blue',xlim=c(0.01,4))
plot(Vectorize(ks.cdf),col='green',add=TRUE,xlim=c(0.01,4))



