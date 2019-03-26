library(phenex)


### Name: modelNDVI
### Title: Main function for NDVI correction and modelling
### Aliases: modelNDVI

### ** Examples

data(avhrr)
data(modis)

# create NDVI object, correct and model values
ndvi.list1 <- modelNDVI(ndvi.values=cbind(avhrr.ndvi/10000, modis.ndvi/10000), 
			year.int=1995, multipleSeasons=FALSE, correction="bise", 
			method="LinIP", MARGIN=2, doParallel=FALSE, slidingperiod=40)
ndvi.list2 <- modelNDVI(ndvi.values=cbind(avhrr.ndvi/10000, modis.ndvi/10000), 
			year.int=1995, multipleSeasons=FALSE, correction="ravg", 
			method="FFT", MARGIN=2, doParallel=FALSE, filter.threshold=7)

# plot Values
for (ndvi.ob in ndvi.list1){ plot(ndvi.ob) } 
for (ndvi.ob in ndvi.list2){ plot(ndvi.ob) }



