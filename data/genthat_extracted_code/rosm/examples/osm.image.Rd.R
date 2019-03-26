library(rosm)


### Name: osm.image
### Title: Get Open Street Map Tiles As A RasterStack
### Aliases: osm.image osm.raster

### ** Examples

## No test: 
library(cartography)
library(raster)
library(prettymapr)

ns <- makebbox(47.2, -59.7, 43.3, -66.4)
x <- osm.raster(ns, projection=CRS("+init=epsg:26920"), crop=TRUE)
# plot using plotRGB (from the raster package)
plotRGB(x)

# use a Spatial* object as the first argument to automatically set the bounding
# box and projection
data(nuts2006)
spdf <- nuts0.spdf[nuts0.spdf$id=="DE",]
x <- osm.raster(spdf, type="thunderforestlandscape")
plotRGB(x)

# write to disk by passing a filename argument (use .tif extension to write GeoTIFF)
osm.raster(ns, projection=CRS("+init=epsg:26920"), crop=TRUE, filename="ns.tif")

# can also write Raster* objects using osm.raster
osm.raster(x, filename="germany.tif")

## End(No test)



