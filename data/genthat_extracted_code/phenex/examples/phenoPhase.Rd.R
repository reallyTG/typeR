library(phenex)


### Name: phenoPhase
### Title: Phenological Phase Extraction
### Aliases: phenoPhase

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object, correct and model NDVI values
	ndvi <- modelNDVI(ndvi.values=avhrr.ndvi/10000, year.int=1995, 
				correction="bise", method="LinIP", MARGIN=2, 
				doParallel=FALSE, slidingperiod=40)[[1]]

	# extract greenup DOY
	greenup <- phenoPhase(ndvi, phase="greenup", method="local", threshold=0.55, n=1000)



