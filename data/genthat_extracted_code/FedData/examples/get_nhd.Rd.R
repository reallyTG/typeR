library(FedData)


### Name: get_nhd
### Title: Download and crop the National Hydrography Dataset.
### Aliases: get_nhd

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the NHD (USA ONLY)
##D NHD <- get_nhd(template=vepPolygon, label='VEPIIN')
##D 
##D # Plot the VEP polygon
##D plot(vepPolygon)
##D 
##D # Plot the NHD data
##D plot(NHD$NHDFlowline, add=T)
##D plot(NHD$NHDLine, add=T)
##D plot(NHD$NHDArea, col='black', add=T)
##D plot(NHD$NHDWaterbody, col='black', add=T)
## End(Not run)



