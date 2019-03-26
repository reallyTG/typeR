library(codadiags)


### Name: maxinv.bay.cdf
### Title: CDF of max(x,1/x) (=cdf(x)-cdf(1)+cdf(1)-cdf(1/x)) where x is
###   'Bay' distributed
### Aliases: maxinv.bay.cdf

### ** Examples

require(codadiags)
plot(null.lim.cdf("ratio_extremum.brownianbridge",forceUseECDF=TRUE),col='blue',xlim=c(0,10))
plot(Vectorize(maxinv.bay.cdf),col='green',add=TRUE,xlim=c(0,10))



