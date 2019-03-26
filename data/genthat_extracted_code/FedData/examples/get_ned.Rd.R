library(FedData)


### Name: get_ned
### Title: Download and crop the 1 (~30 meter) or 1/3 (~10 meter)
###   arc-second National Elevation Dataset.
### Aliases: get_ned

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the NED (USA ONLY)
##D # Returns a raster
##D NED <- get_ned(template=vepPolygon, label='VEPIIN')
##D 
##D # Plot with raster::plot
##D plot(NED)
## End(Not run)



