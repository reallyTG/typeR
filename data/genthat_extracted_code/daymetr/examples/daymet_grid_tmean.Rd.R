library(daymetr)


### Name: daymet_grid_tmean
### Title: Averages tmax and tmin 'Daymet' gridded products into a single
###   mean daily temperature (tmean) gridded output (geotiff) for easy post
###   processing and modelling. Optionally a raster object is returned to
###   the current workspace.
### Aliases: daymet_grid_tmean
### Keywords: daily mean modelling, temperature

### ** Examples


## Not run: 
##D # This code calculates the mean temperature
##D # for all daymet tiles in a user provided
##D # directory. In this example we first
##D # download tile 11935 for tmin and tmax
##D 
##D # download a tile
##D download_daymet_tiles(tiles = 11935,
##D                       start = 1980,
##D                       end = 1980,
##D                       param = c("tmin","tmax"),
##D                       path = tempdir())
##D 
##D # calculate the mean temperature and export
##D # the result to the R workspace (internal = TRUE)
##D # If internal = FALSE, a file tmean_11935_1980.tif
##D # is written into the source path (path_with_daymet_tiles)
##D tmean = daymet_grid_tmean(path = tempdir(),
##D                           tile = 11935,
##D                           year = 1980,
##D                           internal = TRUE)
## End(Not run)



