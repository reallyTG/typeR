library(camsRad)


### Name: cams_api
### Title: API client for CAMS radiation service
### Aliases: cams_api

### ** Examples

## Not run: 
##D library(ncdf4)
##D 
##D filename <- paste0(tempfile(), ".nc")
##D 
##D # API call to CAMS
##D r <- cams_api(
##D   60, 15,                       # latitude=60, longitude=15
##D   "2016-06-01", "2016-06-10",   # for 2016-06-01 to 2016-06-10
##D   time_step="PT01H",            # hourly data
##D   service="get_cams_radiation", # CAMS radiation
##D   format="application/x-netcdf",# netCDF format
##D   filename=filename)            # file to save to
##D 
##D # Access the on disk stored ncdf4 file
##D nc <- nc_open(r$response$content)
##D # list names of available variables
##D names(nc$var)
##D 
##D # create data.frame with timestamp and global horizontal irradiation
##D df <- data.frame(datetime=as.POSIXct(nc$dim$time$vals, "UTC",
##D                                      origin="1970-01-01"),
##D                  GHI = ncvar_get(nc, "GHI"))
##D 
##D plot(df, type="l")
##D 
##D nc_close(nc)
## End(Not run)




