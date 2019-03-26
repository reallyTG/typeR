library(sensors4plumes)


### Name: polygrid2grid
### Title: Coerce SpatialPolygridDataFrame into SpatialGridDataFrame and
###   geoTiff file
### Aliases: polygrid2grid

### ** Examples

data(SPolygridDF)

# return SpatialGridDataFrame
SGridDF1 = polygrid2grid(SPolygridDF, zcol = "b")

# generate geoTiff 
polygrid2grid(SPolygridDF, returnSGDF = FALSE, 
              geoTiffPath = "SPolygridDF1")

# plot SpatialGridDataFrame
spplot(SGridDF1)

# view geoTiff with functions from 'raster' and delete it
SGridDF2 = brick("SPolygridDF1.tif")
plot(SGridDF2)
rm(SGridDF2)
file.remove("SPolygridDF1.tif")



