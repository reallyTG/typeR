library(eseis)


### Name: aux_getevent
### Title: Load seismic data of a user-defined event
### Aliases: aux_getevent
### Keywords: eseis

### ** Examples


## set seismic data directory
dir_data <- paste0(system.file("extdata", package="eseis"), "/")

## load the z component data from a station
data <- aux_getevent(start = as.POSIXct(x = "2017-04-09 01:20:00", 
                                        tz = "UTC"), 
                      duration = 120,
                      station = "RUEG1",
                      component = "BHZ",
                      dir = dir_data)                       
## plot signal
plot_signal(data = data)

## load data from two stations
data <- aux_getevent(start = as.POSIXct(x = "2017-04-09 01:20:00", 
                                        tz = "UTC"), 
                     duration = 120,
                     station = c("RUEG1", "RUEG2"),
                     component = "BHZ",
                     dir = dir_data)

## simplify data structure
data <- lapply(X = data, FUN = function(data) {data[[1]]})

## plot both signals
par(mfcol = c(2, 1))
lapply(X = data, FUN = plot_signal)
                     



