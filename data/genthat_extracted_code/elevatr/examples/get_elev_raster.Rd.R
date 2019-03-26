library(elevatr)


### Name: get_elev_raster
### Title: Get Raster Elevation
### Aliases: get_elev_raster

### ** Examples

## Not run: 
##D loc_df <- data.frame(x = runif(6,min=sp::bbox(lake)[1,1], 
##D                                max=sp::bbox(lake)[1,2]),
##D                      y = runif(6,min=sp::bbox(lake)[2,1], 
##D                                max=sp::bbox(lake)[2,2]))
##D x <- get_elev_raster(locations = loc_df, prj = sp::proj4string(lake), z=10)
##D 
##D data(lake)
##D x <- get_elev_raster(lake, z = 12)
## End(Not run)




