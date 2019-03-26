library(phenex)


### Name: NDVI-class
### Title: Class '"NDVI"'
### Aliases: NDVI-class bise,NDVI-method checkLength,NDVI-method
###   correctedValues<-,NDVI-method correctedValues,NDVI-method
###   isLeapYear,NDVI-method seasons<-,NDVI-method seasons,NDVI-method
###   modelledValues<-,NDVI-method modelledValues,NDVI-method
###   modelValues,NDVI-method phenoPhase,NDVI-method plot,NDVI-method
###   runningAvg<-,NDVI-method runningAvg,NDVI-method values<-,NDVI-method
###   values,NDVI-method year<-,NDVI-method year,NDVI-method
###   rsquare,NDVI-method integrateTimeserie,NDVI-method

### ** Examples

	 ##first example
	# load data
	data(avhrr)
	data(modis)

	# create NDVI object
	ndvi1 <- new("NDVI", values=avhrr.ndvi/10000, year=as.integer(1995))
	ndvi2 <- new("NDVI", values=modis.ndvi/10000, year=as.integer(1995))

	# correct values (bise)
	ndvi1.bise <- bise(ndvi1)
	ndvi2.bise <- bise(ndvi2)

	# or running Average
	ndvi1.ravg <- runningAvg(ndvi1)
	ndvi2.ravg <- runningAvg(ndvi2)

	# model Values
	res1 <- modelValues(ndvi1.bise, method="LinIP")
	res2 <- modelValues(ndvi1.ravg, method="FFT", filter.threshold=7)
	res3 <- modelValues(ndvi2.bise, method="LinIP")
	res4 <- modelValues(ndvi2.bise, method="FFT", filter.threshold=7)

	# plot Values
	plot(res1)
	plot(res2)
	plot(res3)
	plot(res4)

	# extract greenup date
	greenup <- phenoPhase(res1, phase="greenup", method="local", threshold=0.55, n=1000)
	# extract date with highest ndvi
	max.ndvi <- phenoPhase(res1, phase="max", n=1000)

	## or simpler
	data(avhrr)
	data(modis)
	
	# create NDVI objects, correct and model values
	ndvi.list1 <- modelNDVI(ndvi.values=cbind(avhrr.ndvi/10000, modis.ndvi/10000),
			year.int=1995, correction="bise", method="LinIP", MARGIN=2,
			doParallel=FALSE, slidingperiod=40)
	ndvi.list2 <- modelNDVI(ndvi.values=cbind(avhrr.ndvi/10000, modis.ndvi/10000),
			year.int=1995, correction="ravg", method="FFT", MARGIN=2,
			doParallel=FALSE, filter.threshold=7)

	# plot Values
	for (ndvi.ob in ndvi.list1){ plot(ndvi.ob) }
	for (ndvi.ob in ndvi.list2){ plot(ndvi.ob) }
	
	# extract greenup date
	greenup <- phenoPhase(ndvi.list1[[1]], phase="greenup", 
			method="local", threshold=0.55, n=1000)
	# extract senescence date
	senescence <- phenoPhase(ndvi.list1[[1]], phase="senescence", 
			method="local", threshold=0.55, n=1000)
	# extract date with highest NDVI
	max.ndvi <- phenoPhase(ndvi.list1[[1]], phase="max", n=1000)

	# calculate green season integrated vegetation index
	gsivi <- integrateTimeserie(ndvi.list1[[1]], start=greenup, end=senescence, n=1000)



