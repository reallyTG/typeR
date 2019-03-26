library(FedData)


### Name: get_itrdb
### Title: Download the latest version of the ITRDB, and extract given
###   parameters.
### Aliases: get_itrdb

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the ITRDB records
##D ITRDB <- get_itrdb(template=vepPolygon, label='VEPIIN', makeSpatial=T)
##D 
##D # Plot the VEP polygon
##D plot(vepPolygon)
##D 
##D # Map the locations of the tree ring chronologies
##D plot(ITRDB$metadata, pch=1, add=T)
##D legend('bottomleft', pch=1, legend='ITRDB chronologies')
## End(Not run)



