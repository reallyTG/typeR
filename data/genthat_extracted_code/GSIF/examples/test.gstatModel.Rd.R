library(GSIF)


### Name: test.gstatModel-methods
### Title: Methods to test predictability of a regression-kriging model
### Aliases: test.gstatModel-method test.gstatModel
###   test.gstatModel,SpatialPointsDataFrame,formula,SpatialPixelsDataFrame-method
###   test.gstatModel,geosamples,formula,SpatialPixelsDataFrame-method
### Keywords: methods

### ** Examples

# 2D model:
library(sp)
library(maptools)
## load the Meuse data set:
demo(meuse, echo=FALSE)
## model diagnostics:
t1 <- test.gstatModel(meuse, om~dist+ffreq, meuse.grid, 
   fit.family = gaussian(log), Ns=c(80, 155))
t1[[1]]



