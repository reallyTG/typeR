library(phenex)


### Name: modelValues
### Title: NDVI modelling
### Aliases: modelValues

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object
	ndvi <- new("NDVI", values=avhrr.ndvi/10000, year=as.integer(1995))

	# correct values (bise)
	ndvi <- bise(ndvi, slidingperiod=40)

	#model values
	ndvi <- modelValues(ndvi, method="LinIP")

	# plot
	plot(ndvi)



