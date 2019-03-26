library(pedometrics)


### Name: cdfPlot
### Title: Plot estimated cumulative distribution function with confidence
###   limits
### Aliases: cdfPlot
### Keywords: dplot hplot

### ** Examples


## Not run: 
##D ## Estimate the CDF
##D my.cdf <- spsurvey::cont.analysis(spsurvey.obj = my.spsurvey)
##D 
##D ## See indicator levels in the resulting object
##D levels(my.cdf$Pct$Indicator)
##D 
##D ## Plot CDF
##D cdfPlot(obj = my.cdf, ind = "dz", figlab = "",
##D    xlbl = "Difference (m)", xlim = c(-30, 10), type.plot = "s")
## End(Not run)




