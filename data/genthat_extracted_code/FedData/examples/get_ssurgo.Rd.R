library(FedData)


### Name: get_ssurgo
### Title: Download and crop data from the NRCS SSURGO soils database.
### Aliases: get_ssurgo

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the NRCS SSURGO data (USA ONLY)
##D SSURGO.VEPIIN <- get_ssurgo(template=vepPolygon, label='VEPIIN')
##D 
##D # Plot the VEP polygon
##D plot(vepPolygon)
##D 
##D # Plot the SSURGO mapunit polygons
##D plot(SSURGO.VEPIIN$spatial, lwd=0.1, add=T)
##D 
##D # Or, download by Soil Survey Area names
##D SSURGO.areas <- get_ssurgo(template=c('CO670','CO075'), label='CO_TEST')
##D 
##D # Let's just look at spatial data for CO675
##D SSURGO.areas.CO675 <- SSURGO.areas$spatial[SSURGO.areas$spatial$AREASYMBOL=='CO075',]
##D 
##D # And get the NED data under them for pretty plotting
##D NED.CO675 <- get_ned(template=SSURGO.areas.CO675, label='SSURGO_CO675')
##D 
##D # Plot the SSURGO mapunit polygons, but only for CO675
##D plot(NED.CO675)
##D plot(SSURGO.areas.CO675, lwd=0.1, add=T)
## End(Not run)



