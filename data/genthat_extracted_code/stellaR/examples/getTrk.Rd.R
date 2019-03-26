library(stellaR)


### Name: getTrk
### Title: Import stellar track data
### Aliases: getTrk getHb
### Keywords: manip

### ** Examples


  ## Not run: 
##D   trk <- getTrk(0.9, 0.002, 0.25, 1.7, 0)
##D 
##D   ### get data from local directory /data
##D   trk <- getTrk(0.9, 0.002, 0.25, 1.7, 0, baseURL="/data/")
##D 
##D   ###  multi-panel plot of the various quantities with time
##D   track <- getTrk(0.80, 0.001, 0.25, 1.90, 0)
##D   if(!is.na(track)[1]) {
##D   trkdata <- within(stack(track$data), time <- rep(track$data$time,
##D       length.out=length(values)) )
##D   require(lattice)
##D   xyplot( values ~ time | ind, data=trkdata, type="l",
##D       scales=list(y=list(relation="free")))
##D   } 
## End(Not run)



