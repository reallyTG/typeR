library(aire.zmvm)


### Name: get_station_data
### Title: Download pollution data by station
### Aliases: get_station_data

### ** Examples

## Not run: 
##D ## Download daily maximum PM10 data (particulate matter 10 micrometers or
##D ## less in diameter) from 2015 to 2016
##D df <- get_station_data("MAXIMOS", "PM10", 2015:2016)
##D head(df)
##D 
##D ## Download ozone concentration hourly data for 2016
##D df2 <- get_station_data("HORARIOS", "O3", 2016)
##D 
##D ## Convert to local Mexico City time
##D df2$mxc_time <- format(as.POSIXct(paste0(df2$date, " ", df2$hour, ":00"),
##D                                   tz = "Etc/GMT+6"),
##D                        tz = "America/Mexico_City")
##D head(df2)
## End(Not run)



