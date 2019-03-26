library(usdm)


### Name: lisa
### Title: Local indicators of spatial association
### Aliases: lisa lisa,Raster,missing-method
###   lisa,Raster,SpatialPoints-method
###   lisa,Raster,SpatialPointsDataFrame-method
### Keywords: spatial

### ** Examples

## Not run: 
##D 
##D 
##D file <- system.file("external/spain.grd", package="usdm")
##D 
##D r <- brick(file) # reading a RasterBrick object including 10 rasters in Spain
##D 
##D r
##D 
##D plot(r) # visualize the raster layers
##D 
##D plot(r[[1]]) # visualize the first raster layer
##D 
##D r.I <- lisa(x=r[[1]],d1=0,d2=25000,statistic="I") # local Moran's I
##D 
##D plot(r.I)
##D 
##D # entering r instead of r[[1]], givees the indicator for each layer:
##D r.I <- lisa(x=r,d1=0,d2=25000,statistic="I")
##D plot(r.I)
##D 
##D r.c <- lisa(x=r[[1]],d1=0,d2=25000,statistic="c") # local Geary's c
##D 
##D plot(r.c)
##D 
##D r.g <- lisa(x=r[[1]],d1=0,d2=25000,statistic="G") # G statistic
##D 
##D plot(r.g)
##D 
##D r.g2 <- lisa(x=r[[1]],d1=0,d2=25000,statistic="G*") # G* statistic
##D 
##D plot(r.g2)
##D 
##D r.K1 <- lisa(x=r[[1]],d1=0,d2=30000,statistic="K1") # gives K1 statistic for each layer
##D 
##D plot(r.K1)
##D 
##D lisa(x=r,d1=0,d2=30000,cell=2000,statistic="I") # gives local Moran's I at cell number 2000
##D #for each raster layer in r
##D 
##D lisa(x=r,d1=0,d2=30000,cell=c(2000,2002,2003),statistic="c") # calculates local Moran's I
##D # at cell numbers of 2000,2002, and 2003 for each raster layer in r
##D 
##D sp <- sampleRandom(r[[1]],20,sp=TRUE) # draw 20 random points from r, 
##D # and returns a SpatialPointsDataFrame
##D 
##D plot(r[[1]])
##D 
##D points(sp)
##D 
##D lisa(x=r,y=sp,d1=0,d2=30000,statistic="I") # calculates the local Moran's I at 
##D # point locations in sp for each raster layer in r
## End(Not run)





