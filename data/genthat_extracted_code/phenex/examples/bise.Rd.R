library(phenex)


### Name: bise
### Title: Best index slope extraction
### Aliases: bise

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object
	ndvi <- new("NDVI", values=avhrr.ndvi/10000, year=as.integer(1995))

	# correct values (bise)
	ndvi.bise <- bise(ndvi, slidingperiod=40, growthFactorThreshold=0.1)

	#plot
	plot(ndvi.bise)



