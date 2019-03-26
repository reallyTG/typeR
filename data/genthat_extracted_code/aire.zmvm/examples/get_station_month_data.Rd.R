library(aire.zmvm)


### Name: get_station_month_data
### Title: Download monthly pollution data
### Aliases: get_station_month_data

### ** Examples

## Not run: 
##D ## Download daily hourly PM10 data (particulate matter 10 micrometers or
##D ## less in diameter) from March 2016
##D df_pm10 <- get_station_month_data("HORARIOS", "PM10", 2016, 3)
##D head(df_pm10)
##D 
##D ## Download daily hourly O3 data from October 2017
##D df_o3 <- get_station_month_data("HORARIOS", "O3", 2018, 1)
##D ## Convert to local Mexico City time
##D df_o3$mxc_time <- format(as.POSIXct(paste0(df_o3$date,
##D                                            " ",
##D                                            df_o3$hour, ":00"),
##D                                     tz = "Etc/GMT+6"),
##D                          tz = "America/Mexico_City")
##D head(df_o3)
## End(Not run)



