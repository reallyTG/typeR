library(phenex)


### Name: correctedValues
### Title: Corrected Value Accessor
### Aliases: correctedValues

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object, correct and model values
	ndvi.list <- modelNDVI(ndvi.values=avhrr.ndvi/10000, year.int=1995, 
			correction="bise", method="LinIP", MARGIN=2, 
			doParallel=FALSE, slidingperiod=40)
	ndvi <- ndvi.list[[1]]

	#get modelled values
	biseValues <- correctedValues(ndvi)



