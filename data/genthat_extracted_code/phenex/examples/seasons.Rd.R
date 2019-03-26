library(phenex)


### Name: seasons
### Title: Seasons Accessor
### Aliases: seasons

### ** Examples

	# load data
	data(avhrr)

	# create NDVI object, correct and model values
	ndvi.list <- modelNDVI(ndvi.values=c(avhrr.ndvi/10000,avhrr.ndvi/10000), 
			year.int=1995, detectSeasons=TRUE,
			correction="bise", method="LinIP", MARGIN=2, 
			doParallel=FALSE, slidingperiod=40)
	ndvi <- ndvi.list[[1]]

	#get seasons
	seasondates <- seasons(ndvi)



