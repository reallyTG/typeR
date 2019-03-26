library(eseis)


### Name: aux_getFDSNdata
### Title: Download seismic data from FDSN data base
### Aliases: aux_getFDSNdata
### Keywords: eseis

### ** Examples


## Not run: 
##D 
##D ## get stations < 0.6 degrees away from Piz Chengalo collapse
##D x <- aux_getFDSNstation(centre = c(46.3, 9.6),
##D                         radius = 0.6,
##D                         access = TRUE)
##D 
##D ## sort statiions by distance
##D x <- x[order(x$distance),]
##D 
##D ## download available data
##D d <- aux_getFDSNdata(start = as.POSIXct(x = "2017-08-23 07:30:00", 
##D                                         tz = "UTC"),
##D                      duration = 180, 
##D                      network = x$network_ID, 
##D                      station = x$station_code, 
##D                      url = x$network_url)
##D 
##D ## remove stations without available data
##D x <- x[!unlist(lapply(d, is.null)),]
##D d <- d[!unlist(lapply(d, is.null))]
##D 
##D ## generate plots of the three nearest stations
##D par(mfcol = c(3, 1))
##D 
##D for(i in 1:3) {
##D 
##D   plot_signal(data = d[[i]],
##D               main = paste(x$ID[i], 
##D                            " | ",
##D                            round(x$distance[i], 2),
##D                            "distance (DD)"))
##D } 
## End(Not run)
                     



