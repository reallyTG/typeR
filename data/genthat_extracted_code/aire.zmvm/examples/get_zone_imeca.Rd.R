library(aire.zmvm)


### Name: get_zone_imeca
### Title: Download pollution data by zone in IMECAs
### Aliases: get_zone_imeca

### ** Examples

## There was a regional (NE) PM10 pollution emergency on Jan 6, 2017
get_zone_imeca("MAXIMOS", "PM10", "NE", "2017-01-05", "2017-01-08",
               show_messages = FALSE)

## There was an ozone pollution emergency on May 15, 2017
get_zone_imeca("MAXIMOS", "O3", "TZ", "2017-05-15", "2017-05-15",
               show_messages = FALSE)

## Not run: 
##D ## Download daily maximum PM10 data (particulate matter 10 micrometers or
##D ## less in diameter) from 2015-01-01 to 2016-03-20 for all geographic zones
##D df <- get_zone_imeca("MAXIMOS", "PM10", "TZ", "2015-01-01", "2016-03-20")
##D head(df)
##D 
##D ## Download hourly O3 pollution data for May 15, 2017. Only the suroeste zone
##D df2 <- get_zone_imeca("HORARIOS", "O3", "SO", "2017-05-15", "2017-05-15")
##D 
##D ## Convert to local Mexico City time
##D df2$mxc_time <- format(as.POSIXct(paste0(df2$date, " ", df2$hour, ":00"),
##D                                   tz = "Etc/GMT+6"),
##D                        tz = "America/Mexico_City")
##D 
##D head(df2)
## End(Not run)




