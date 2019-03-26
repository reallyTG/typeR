library(ocedata)


### Name: turbulence
### Title: Grant et al. (1962) turbulence data
### Aliases: turbulence
### Keywords: datasets

### ** Examples

## Not run: 
##D ## Recreate Fig 9 of Grant et al. (1962), with intercept
##D ## chosen to mimic the published figure
##D data(turbulence, package="ocedata")
##D plot(log10(turbulence$k), log10(turbulence$phi),
##D      xlab=expression(log[10]*k), ylab=expression(log[10]*phi), pch=20)
##D grid()
##D power <- -5/3
##D intercept <- -0.3
##D abline(intercept, power)
## End(Not run)



