library(eseis)


### Name: aux_getIRISdata
### Title: Download seismic data from IRIS data base
### Aliases: aux_getIRISdata
### Keywords: eseis

### ** Examples


## Not run: 
##D 
##D sncl <- aux_getIRISstation(start = as.POSIXct("2010-01-01 22:22:22", 
##D                                                tz = "UTC"), 
##D                             duration = 120, 
##D                             location = c(53, 13), 
##D                             radius = 0.7, 
##D                             component = "BHZ")
##D 
##D s <- aux_getIRISdata(start = as.POSIXct("2010-01-01 22:22:22", 
##D                                            tz = "UTC"), 
##D                         duration = 120,
##D                         sncl = sncl$sncl[1])
##D                         
##D plot_signal(data = s[[1]])
## End(Not run)
                     



