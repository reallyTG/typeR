library(pycno)


### Name: Estimation of Population from Pycnophylatic Interpolation
### Title: Estimate populations for a set of zones based on pycnophylactic
###   interpolation
### Aliases: estimate.pycno
### Keywords: smoothing spatial

### ** Examples

# Read in data for North Carolina as a SpatialPolygonsDataFrame
nc.sids <- readShapeSpatial(system.file("shapes/sids.shp", package="maptools")[1], 
  IDvar="FIPSNO", proj4string=CRS("+proj=longlat +ellps=clrk66"))

# Compute the pycnophylactic surface for 1974 births as a SpatialGridDataFrame
# Note probably shouldn't really base grid cells on Lat/Long coordinates
# This example just serves to illustrate the use of the functions
births74 <- pycno(nc.sids,nc.sids$BIR74,0.05,converge=1)

# Create a new 'blocky' set of zones
blocks <- gUnionCascaded(nc.sids,1*(coordinates(nc.sids)[,2] > 36) + 
  2*(coordinates(nc.sids)[,1] > -80))
# Plot the bloocky zones
plot(blocks)
# Aggregate data to them
estimates <- estimate.pycno(births74,blocks)
# Write the estimates on to the map
text(coordinates(blocks),as.character(estimates))



