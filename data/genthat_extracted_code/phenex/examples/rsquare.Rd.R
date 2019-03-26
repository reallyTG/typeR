library(phenex)


### Name: rsquare
### Title: Squared Pearson correlation coefficient
### Aliases: rsquare

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object, correct and model values
	ndvi.list <- modelNDVI(ndvi.values=avhrr.ndvi/10000, 
			year.int=1995, correction="bise", method="Growth", MARGIN=2, 
			doParallel=FALSE, slidingperiod=40)

	#plot
	plot(ndvi.list[[1]])

	# squared Pearson correlation coefficient
	rsquare(ndvi.list[[1]])



