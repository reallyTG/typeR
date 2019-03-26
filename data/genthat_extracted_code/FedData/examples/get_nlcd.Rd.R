library(FedData)


### Name: get_nlcd
### Title: Download and crop the National Land Cover Database.
### Aliases: get_nlcd

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the NLCD (USA ONLY)
##D # Returns a raster
##D NLCD <- get_nlcd(template=vepPolygon, label='VEPIIN')
##D 
##D # Plot with raster::plot
##D plot(NLCD)
## End(Not run)



