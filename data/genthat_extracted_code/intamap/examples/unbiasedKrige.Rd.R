library(intamap)


### Name: unbiasedKrige
### Title: Unbiased kriging
### Aliases: unbiasedKrige
### Keywords: spatial

### ** Examples

library(automap)
library(gstat)
data(meuse)
data(meuse.grid)
coordinates(meuse) = ~x+y
gridded(meuse.grid) = ~x+y

predictionLocations = meuse.grid[sample(1:length(meuse.grid),50),]
vmod = autofitVariogram(log(zinc)~1,meuse)$var_model
prediction = krige(log(zinc)~1,meuse,predictionLocations,vmod)
summary(prediction)

prediction <- unbiasedKrige(prediction,log(zinc)~1,
  meuse,  model = vmod, outputWhat = list(MOK = 6.0, MOK = 7.0, IWQSEL=7.0), 
  iwqmaxit = 100, iwqCpAddLim = 0.01)
summary(prediction)



