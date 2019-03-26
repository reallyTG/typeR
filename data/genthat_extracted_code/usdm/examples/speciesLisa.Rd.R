library(usdm)


### Name: speciesLisa
### Title: LISA in predictors at species occurrence locations
### Aliases: speciesLisa speciesLisa,Raster,SpatialPoints-method
###   speciesLisa,Raster,SpatialPointsDataFrame-method
### Keywords: spatial

### ** Examples

## Not run: 
##D file <- system.file("external/predictors.grd", package="usdm")
##D 
##D r <- brick(file) # reading a RasterBrick object including 4 rasters in the Netherlands
##D 
##D r 
##D 
##D plot(r) # visualize the raster layers
##D 
##D 
##D files.path <- system.file("external", package="usdm") # path to location of example files
##D require(rgdal)
##D sp <- readOGR(dsn=files.path,layer="species_nl") # reading species data (shapefile)
##D 
##D # alternatively, to read species data you can use:
##D require(maptools)
##D sp.file <- system.file("external/species_nl.shp", package="usdm")
##D sp <- readShapePoints(sp.file)
##D 
##D 
##D splisa <- speciesLisa(x=r,y=sp,uncertainty=15000,weights=c(0.22,0.2,0.38,0.2))
##D 
##D splisa
##D 
##D plot(splisa)
##D 
##D bnd <- readOGR(dsn=files.path,layer="boundary") # reading the boundary map
##D 
##D plot(splisa,bnd)
## End(Not run)





