library(phenex)


### Name: runningAvg
### Title: Running Average
### Aliases: runningAvg

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object
	ndvi <- new("NDVI", values=avhrr.ndvi/10000, year=as.integer(1995))

	# correct values (bise)
	ndvi.ravg <- runningAvg(ndvi, window=7)

	#plot
	plot(ndvi.ravg)



