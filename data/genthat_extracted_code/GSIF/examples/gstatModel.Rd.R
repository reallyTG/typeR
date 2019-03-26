library(GSIF)


### Name: gstatModel-class
### Title: A class for a geostatistical model
### Aliases: gstatModel-class validate,gstatModel-method
###   plot,gstatModel,ANY-method validate print.gstatModel plot.gstatModel
### Keywords: classes

### ** Examples
 
## load observations:
library(plotKML)
library(sp)
library(maptools)
demo(meuse, echo=FALSE)
data(meuse)
coordinates(meuse) <- ~x+y
proj4string(meuse) <- CRS("+init=epsg:28992")
## load grids:
data(meuse.grid)
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
proj4string(meuse.grid) <- CRS("+init=epsg:28992")
## fit a model:
omm <- fit.gstatModel(meuse, om~dist+ffreq, 
  fit.family=gaussian(link="log"), meuse.grid)
plot(omm)
## produce SpatialPredictions:
om.rk <- predict(omm, predictionLocations = meuse.grid)
plot(om.rk)
## run a proper cross-validation:
rk.cv <- validate(omm)
## RMSE:
sqrt(mean((rk.cv$validation$var1.pred-rk.cv$validation$observed)^2))



