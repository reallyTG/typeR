library(codadiags)


### Name: cvm.cdf
### Title: Cramer von Mises cumulative density function, import from coda
###   package.
### Aliases: cvm.cdf

### ** Examples

require(codadiags)
plot(null.lim.cdf("var.brownianbridge",forceUseECDF=TRUE),col='blue')
plot(Vectorize(cvm.cdf),col='green',add=TRUE)



