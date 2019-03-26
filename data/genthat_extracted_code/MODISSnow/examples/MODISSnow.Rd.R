library(MODISSnow)


### Name: download_data
### Title: Download MODIS snow cover data (version 6) from the National
###   Snow and Ice Data Center.
### Aliases: download_data get_tile

### ** Examples

## Not run: 
##D # Download MODIS snow data for a central europe h = 18 and v = 5 for the 1 of January 2016
##D dat <- download_data(lubridate::ymd("2016-01-01"), h = 18, v = 5)
##D class(dat)
##D raster::plot(dat)
## End(Not run)



