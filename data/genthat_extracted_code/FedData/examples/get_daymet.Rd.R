library(FedData)


### Name: get_daymet
### Title: Download and crop the 1-km DAYMET daily weather dataset.
### Aliases: get_daymet

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000),
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the DAYMET (North America only)
##D # Returns a list of raster bricks
##D DAYMET <- get_daymet(template=vepPolygon,
##D                      label='VEPIIN',
##D                      elements = c('prcp','tmin','tmax'),
##D                      years = 1980:1985)
##D 
##D # Plot with raster::plot
##D plot(DAYMET$tmin$X1985.10.23)
## End(Not run)



