library(pycno)


### Name: pycno-package
### Title: Pycnophylactic Interpolation
### Aliases: pycno-package
### Keywords: package

### ** Examples

# Read in data for North Carolina as a SpatialPolygonsDataFrame
nc.sids <- readShapeSpatial(system.file("shapes/sids.shp", package="maptools")[1], 
  IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))

# Compute the pycnophylactic surface for 1974 births as a SpatialGridDataFrame
# Note probably shouldn't really base grid cells on Lat/Long coordinates
# This example just serves to illustrate the use of the function
births74 <- pycno(nc.sids,nc.sids$BIR74,0.05, converge=1)

# Draw it
image(births74)

# Overlay North Carolina county boundaries for reference
plot(nc.sids,add=TRUE)



