library(eseis)


### Name: aux_stationinfofile
### Title: Create station info file from cube files.
### Aliases: aux_stationinfofile
### Keywords: eseis

### ** Examples


## Not run: 
##D 
##D ## basic example with minimum effort
##D aux_stationinfofile(name = "stationinfo", 
##D                     input_dir = "input", 
##D                     logger_ID = c("864", "876", "AB1"),
##D                     gipptools = "software/gipptools-2015.225")
##D 
##D ## example with more adjustments
##D aux_stationinfofile(name = "stationinfo",
##D                     input_dir = "input",
##D                     logger_ID = c("864", "876", "AB1"),
##D                     station_name = c("KTZ01", "KTZ02", "KTZ03"), 
##D                     station_z = c(30, 28, 29), 
##D                     station_d = rep(0.5, 3), 
##D                     sensor_type = rep("TC120s", 3), 
##D                     logger_type = rep("Cube3ext", 3), 
##D                     unit = "utm", 
##D                     n = 1, 
##D                     cpu = 0.9,
##D                     gipptools = "software/gipptools-2015.225", 
##D                     write_raw = TRUE, 
##D                     write_data = TRUE)
##D 
## End(Not run)




