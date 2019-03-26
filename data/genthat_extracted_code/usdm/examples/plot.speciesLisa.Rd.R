library(usdm)


### Name: plot.speciesLISA
### Title: Plot positional uncertainty based on LISA
### Aliases: plot.speciesLISA plot,speciesLISA,missing-method
###   plot,speciesLISA,SpatialPolygons-method
###   plot,speciesLISA,SpatialPolygonsDataFrame-method
### Keywords: methods spatial

### ** Examples

file <- system.file("external/predictors.grd", package="usdm")

r <- brick(file) # reading a RasterBrick including 5 rasters (predictor variables)

r 

plot(r) # visualize the raster layers


#files.path <- system.file("external", package="usdm") # path to location of example files
#require(rgdal)
#sp <- readOGR(dsn=files.path,layer="species_nl") # reading species data (shapefile)

#splisa <- speciesLisa(x=r,y=sp,uncertainty=15000,weights=c(0.22,0.2,0.38,0.2))

#splisa

#plot(splisa)

#bnd <- readOGR(dsn=files.path,layer="boundary") # reading the boundary map

#plot(splisa,bnd)

#plot(splisa,bnd,levels=c(2,4,6,8))

#plot(splisa,bnd,levels=c(-5,-3,0,3,5))




