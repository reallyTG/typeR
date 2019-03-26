library(daymetr)


### Name: daymet_grid_agg
### Title: Aggregate daily Daymet data
### Aliases: daymet_grid_agg
### Keywords: climate data daymet,

### ** Examples


 ## Not run: 
##D  # This code calculates the average minimum temperature by 
##D  # season for a subset region.
##D  
##D  # download default ncss tiled subset for 1980
##D  # (daily tmin values only), works on tiles as well
##D  download_daymet_ncss()
##D      
##D  # Finally, run the function
##D  daymet_grid_agg(file = paste0(tempdir(),"/tmin_daily_1980_ncss.nc"),
##D                  int = "seasonal",
##D                  fun = "mean")
##D  
## End(Not run)



