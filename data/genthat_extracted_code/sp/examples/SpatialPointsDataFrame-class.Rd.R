library(sp)


### Name: SpatialPointsDataFrame-class
### Title: Class "SpatialPointsDataFrame"
### Aliases: SpatialPointsDataFrame-class [,SpatialPointsDataFrame-method
###   coerce,SpatialPointsDataFrame,data.frame-method
###   coerce,SpatialPointsDataFrame,SpatialPoints-method
###   show,SpatialPointsDataFrame-method
###   points,SpatialPointsDataFrame-method
###   coordinates,SpatialPointsDataFrame-method
###   as.data.frame.SpatialPointsDataFrame dim.SpatialPointsDataFrame
###   print.SpatialPointsDataFrame ShowSpatialPointsDataFrame
###   as.SpatialPoints.SpatialPointsDataFrame rbind.SpatialPointsDataFrame
###   row.names.SpatialPointsDataFrame
###   coerce,ppp,SpatialPointsDataFrame-method
### Keywords: classes

### ** Examples

data(meuse)
xy = meuse[c("x", "y")] # retrieve coordinates as data.frame
class(meuse)
data(meuse) # reload data.frame
coordinates(meuse) = c("x", "y") # specify column names
class(meuse)
data(meuse) # reload data.frame
coordinates(meuse) = c(1, 2) # specify column names
class(meuse)
data(meuse) # reload data.frame
coordinates(meuse) = ~x+y # formula
class(meuse)
data(meuse) # reload data.frame
coordinates(meuse) = xy   # as data frame
class(meuse)
data(meuse) # reload data.frame
coordinates(meuse) = as.matrix(xy)   # as matrix
meuse$log.zn = log(meuse$zinc)
class(meuse)
dim(meuse)



