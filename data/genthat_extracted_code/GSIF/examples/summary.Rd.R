library(GSIF)


### Name: summary-methods
### Title: Summarize an object of class '"SpatialPredictions"'
### Aliases: summary summary,SpatialPredictions-method
###   show,SpatialPredictions-method

### ** Examples

## load observations:
library(sp)
library(rgdal)
library(gstat)
demo(meuse, echo=FALSE)
## fit a model:
omm <- fit.gstatModel(meuse, om~dist, 
  fit.family=gaussian(link="log"), meuse.grid)
show(omm@regModel)
## produce SpatialPredictions:
om.rk <- predict(omm, predictionLocations = meuse.grid)
x = summary(om.rk)
str(x)



