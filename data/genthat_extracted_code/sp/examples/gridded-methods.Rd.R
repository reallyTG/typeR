library(sp)


### Name: gridded-methods
### Title: specify spatial data as being gridded, or find out whether they
###   are
### Aliases: gridded-methods gridparameters fullgrid
###   fullgrid,Spatial-method gridded gridded,Spatial-method fullgrid<-
###   gridded<- fullgrid<-,Spatial,ANY-method
###   fullgrid<-,SpatialGrid,logical-method
###   fullgrid<-,SpatialGridDataFrame,logical-method
###   fullgrid<-,SpatialPixels,logical-method
###   fullgrid<-,SpatialPixelsDataFrame,logical-method
###   gridded<-,SpatialGrid,logical-method
###   gridded<-,SpatialGridDataFrame,logical-method
###   gridded<-,SpatialPixels,logical-method
###   gridded<-,SpatialPixelsDataFrame,logical-method
###   gridded<-,SpatialPoints,list-method
###   gridded<-,SpatialPoints,logical-method
###   gridded<-,SpatialPointsDataFrame,list-method
###   gridded<-,SpatialPointsDataFrame,logical-method
###   gridded<-,data.frame,GridTopology-method
###   gridded<-,data.frame,character-method
###   gridded<-,data.frame,formula-method
### Keywords: methods spatial

### ** Examples

# just 9 points on a grid:
x <- c(1,1,1,2,2,2,3,3,3)
y <- c(1,2,3,1,2,3,1,2,3)
xy <- cbind(x,y)
S <- SpatialPoints(xy)
class(S)
plot(S)
gridded(S) <- TRUE
gridded(S)
class(S)
summary(S)
plot(S)
gridded(S) <- FALSE
gridded(S)
class(S)

# data.frame
data(meuse.grid)
coordinates(meuse.grid) <- ~x+y
gridded(meuse.grid) <- TRUE
plot(meuse.grid) # not much good
summary(meuse.grid)




