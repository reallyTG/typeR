library(wppExplorer)


### Name: wpp.indicator
### Title: Accessing a WPP Indicator
### Aliases: wpp.indicator
### Keywords: manip

### ** Examples

	tfr <- wpp.indicator("fert")
	## Not run: 
##D 	# Histogram of TFR 
##D 	print(qplot(value, data=tfr) + facet_wrap(~ Year))
## End(Not run)
	## Not run: 
##D 	mxM01 <- wpp.indicator("mortagesex", sex="M", age="0")
##D 	# Plot map
##D 	plot(gvisGeoMap(tfr, locationvar='charcode', numvar='value'))
## End(Not run)



