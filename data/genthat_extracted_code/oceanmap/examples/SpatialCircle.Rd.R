library(oceanmap)


### Name: SpatialCircle
### Title: Creates a circle of radius r around a specified point.
### Aliases: SpatialCircle
### Keywords: bathymetry circle data extraction

### ** Examples


## Example 1: load & plot bathymetry of the Baltic Sea, defined by longitudes and latidtues
lon <- c(9, 31)
lat <- c(53.5, 66)
# bathy <- get.bathy(lon=lon, lat=lat, main="Baltic Sea", cbpos='r')
plotmap(lon=lon, lat=lat)
spc <- SpatialCircle(x= 20,y = 57.5,r=1)
plot(spc,add=TRUE)
# get.avg.bathy(c(20,57.5), radius = 1, bathy = bathy)
# get.avg(c(20,57.5), radius = 1, unit="km",raster = bathy)




