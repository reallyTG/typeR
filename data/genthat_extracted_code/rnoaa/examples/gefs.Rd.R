library(rnoaa)


### Name: gefs
### Title: Get GEFS ensemble forecast data for a specific lat/lon.
### Aliases: gefs gefs_CONNECT gefs_GET gefs_latitudes gefs_longitudes
###   gefs_variables gefs_dimensions gefs_dimension_values

### ** Examples

## Not run: 
##D 
##D #avialable latitudes and longitudes
##D gefs_latitudes()
##D gefs_longitudes()
##D 
##D #get a list of all gefs variables
##D gefs_variables()
##D 
##D #All GEFS dimensions
##D gefs_dimensions()
##D 
##D #values for a specific dimension
##D gefs_dimension_values("height_above_ground")
##D 
##D #example location.
##D lat <- 46.28125
##D lon <- -116.2188
##D 
##D #Get forecast for a certain variable.
##D forecast <- gefs("Total_precipitation_surface_6_Hour_Accumulation_ens",
##D   lat, lon)
##D 
##D #Fetch a different date (available up to 10 days prior to today)
##D forecast_yesterday_prec <- gefs(
##D    "Total_precipitation_surface_6_Hour_Accumulation_ens",
##D    lat, lon, date=format(as.Date(Sys.time()) - 1, "%Y%m%d"))
##D 
##D #specific ensemble and times, for the 1800 forecast.
##D # here ensembles 1-3 (ensembles are numbered starting with 0)
##D # and time for 2 days from today at 1800
##D date <- format(as.Date(Sys.time()) - 1, "%Y%m%d")
##D var <- "Temperature_height_above_ground_ens"
##D gefs(var, lat, lon, date = date, forecast_time = "1800", ens_idx=2:4,
##D   time_idx=1:8)
##D 
##D #One ensemble, all latitudes and longitudes (this is a big file) for the
##D # next 3 days.
##D # gefs(var, ens=1, time=1:12)
## End(Not run)




