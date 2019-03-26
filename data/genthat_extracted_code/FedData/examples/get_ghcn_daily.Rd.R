library(FedData)


### Name: get_ghcn_daily
### Title: Download and crop the Global Historical Climate Network-Daily
###   data.
### Aliases: get_ghcn_daily

### ** Examples

## Not run: 
##D # Extract data for the Village Ecodynamics Project 'VEPIIN' study area:
##D # http://village.anth.wsu.edu
##D vepPolygon <- polygon_from_extent(raster::extent(672800,740000,4102000,4170000), 
##D      proj4string='+proj=utm +datum=NAD83 +zone=12')
##D 
##D # Get the daily GHCN data (GLOBAL)
##D # Returns a list: the first element is the spatial locations of stations,
##D # and the second is a list of the stations and their daily data
##D GHCN.prcp <- get_ghcn_daily(template=vepPolygon, label='VEPIIN', elements=c('prcp'))
##D 
##D # Plot the VEP polygon
##D plot(vepPolygon)
##D 
##D # Plot the spatial locations
##D plot(GHCN.prcp$spatial, pch=1, add=T)
##D legend('bottomleft', pch=1, legend='GHCN Precipitation Records')
##D 
##D # Elements for which you require the same data
##D # (i.e., minimum and maximum temperature for the same days)
##D # can be standardized using standardize==T
##D GHCN.temp <- get_ghcn_daily(template=vepPolygon, 
##D      label='VEPIIN', 
##D      elements=c('tmin','tmax'), 
##D      standardize=T)
##D 
##D # Plot the VEP polygon
##D plot(vepPolygon)
##D 
##D # Plot the spatial locations
##D plot(GHCN.temp$spatial, pch=1, add=T)
##D legend('bottomleft', pch=1, legend='GHCN Temperature Records')
## End(Not run)



