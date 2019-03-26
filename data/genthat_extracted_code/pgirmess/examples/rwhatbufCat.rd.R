library(pgirmess)


### Name: rwhatbufCat
### Title: Extract the contents of a SpatialPixelsDataFrame or a
###   SpatialGridDataFrame of categorical values within various buffer
###   sizes centred on spatial points
### Aliases: rwhatbufCat
### Keywords: spatial

### ** Examples


# raster creation
library(sp)
data(meuse.grid)
coordinates(meuse.grid) = ~x+y
gridded(meuse.grid) = TRUE

# random selection of points within the raster area
mypoints<-spsample(meuse.grid,n=10,type="random") # random points are appx 10, see spsample doc
mypoints<-SpatialPointsDataFrame(coordinates(mypoints),data.frame(id=1:nrow(mypoints@coords)))

image(meuse.grid,att=4,col=c("red","green","blue")) # soil map
plot(mypoints,add=TRUE) # points
  # get the number of pixels of each category in each buffer
rwhatbufCat(meuse.grid,mypoints,c(500,1000),att=4) 




