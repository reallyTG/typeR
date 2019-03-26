library(daymetr)


### Name: calc_nd
### Title: Count days meeting set criteria (for gridded Daymet data files)
### Aliases: calc_nd
### Keywords: Daymet, gridded series, summary time

### ** Examples


## Not run: 
##D # download daily gridded data
##D # using default settings (data written to tempdir())
##D download_daymet_ncss()
##D 
##D # read in the Daymet file and report back the number
##D # of days in a year with a minimum temperature lower
##D # than 15 degrees C
##D r = calc_nd(file.path(tempdir(),"tmin_daily_1980_ncss.nc"),
##D             criteria = "<",
##D             value = 15,
##D             internal = TRUE)
##D             
##D # plot the output
##D raster::plot(r)
## End(Not run)



