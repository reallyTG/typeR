library(aire.zmvm)


### Name: get_station_imeca
### Title: Download pollution data by station in IMECAs
### Aliases: get_station_imeca

### ** Examples

## Not run: 
##D ## There was an ozone pollution emergency on May 15, 2017
##D df_o3 <- get_station_imeca("O3", "2017-05-15", show_messages = FALSE)
##D 
##D ## Convert to local Mexico City time
##D df_o3$mxc_time <- format(as.POSIXct(paste0(df_o3$date,
##D                                            " ",
##D                                            df_o3$hour,
##D                                            ":00"),
##D                                     tz = "Etc/GMT+6"),
##D                          tz = "America/Mexico_City")
##D head(df_o3[order(-df_o3$value), ])
## End(Not run)



