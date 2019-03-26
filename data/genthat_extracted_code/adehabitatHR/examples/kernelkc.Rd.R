library(adehabitatHR)


### Name: kernelkc
### Title: Kernel Smoothing in Space and Time of the Animals' Use of Space
### Aliases: kernelkc kernelkcbase getvolumeUDk getvolumeUDs getverticeshrk
###   getverticeshrs exwc
### Keywords: spatial

### ** Examples


## Not run: 
##D 
##D 
##D ################################################
##D ##
##D ## Illustrates the analysis of recoveries of
##D ## ringed data
##D 
##D data(teal)
##D head(teal)
##D 
##D ## compute the sequence of dates at which the
##D ## probability density function (pdf) of recoveries is to be estimated
##D 
##D vv <- seq(min(teal$date), max(teal$date), length=50)
##D head(vv)
##D 
##D ## The package "maps" should be installed for the example below
##D library(maps)
##D 
##D 
##D re <- lapply(1:length(vv), function(i) {
##D 
##D              ## Estimate the pdf. We choose a smoothing parameter of
##D              ## 2 degrees of lat-long for X and Y coordinates,
##D              ## and of 2 months for the time
##D              uu <- kernelkcbase(teal, c(2.5,2.5,2*30*24*3600), tcalc =
##D                                 vv[i], grid=100, extent=0.1)
##D 
##D              ## now, we show the result
##D              ## potentially, we could type
##D              ##
##D              ## jpeg(paste("prdefu", i, ".jpg", sep=""))
##D              ##
##D              ## to store the figures in a file, and then to build a
##D              ## movie with the resulting files:
##D              ##
##D 
##D              image(uu, col=grey(seq(1,0, length=8)))
##D              title(main=vv[i])
##D 
##D              ## highlight the area on which there is a probability
##D              ## equal to 0.95 to recover a bird
##D              ## ****warning! The argument standardize=TRUE should
##D              ## be passed, because the UD is defined in space and
##D              ## time, and because we estimate the UD just in space
##D              plot(getverticeshr(uu, 95, standardize=TRUE), add=TRUE,
##D                   border="red", lwd=2)
##D 
##D              ## The map:
##D              map(xlim=c(-20,70), ylim=c(30,80), add=TRUE)
##D 
##D              ## and if we had typed jpeg(...) before, we have to type
##D              ## dev.off()
##D              ## to close the device. When we have finished this loop
##D              ## We could combine the resulting files with imagemagick
##D              ## (windows) or mencoder (linux)
##D              })
##D 
##D 
##D 
##D 
##D ################################################
##D ##
##D ## Illustrates how to explore the UD in time and
##D ## space with the bear data
##D 
##D data(bear)
##D 
##D ## compute the sequence of dates at which the UD is to be
##D ## estimated
##D vv <- seq(min(bear[[1]]$date), max(bear[[1]]$date), length=50)
##D head(vv)
##D 
##D ## estimates the UD at each time point
##D re <- lapply(1:length(vv), function(i) {
##D 
##D              ## estimate the UD. We choose a smoothing parameter of
##D              ## 1000 meters for X and Y coordinates, and of 72 hours
##D              ## for the time (after a visual exploration)
##D              uu <- kernelkc(bear, h = c(1000,1000,72*3600),
##D                             tcalc= vv[i], grid=100)
##D 
##D              ## now, we show the result
##D              ## potentially, we could type
##D              ##
##D              ## jpeg(paste("UD", i, ".jpg", sep=""))
##D              ##
##D              ## to store the figures in a file, and then to build a
##D              ## movie with the resulting files:
##D              ##
##D              image(uu, col=grey(seq(1,0,length=10)))
##D              title(main=vv[i])
##D 
##D              ## highlight the 95 percent home range
##D              ## we set standardize = TRUE because we want to estimate
##D              ## the home range in space from a UD estimated in space and
##D              ## time
##D              plot(getverticeshr(uu, 95, standardize=TRUE), lwd=2,
##D                   border="red", add=TRUE)
##D 
##D              ## and if we had typed jpeg(...) before, we have to type
##D              ## dev.off()
##D              ## to close the device. When we have finished this loop
##D              ## We could combine the resulting files with imagemagick
##D              ## (windows) or mencoder (linux)
##D              })
##D 
##D 
##D ## Or, just show the home range:
##D re <- lapply(1:length(vv), function(i) {
##D 
##D              uu <- kernelkc(bear, h = c(1000,1000,72*3600),
##D                             tcalc= vv[i])
##D 
##D              pc <- getverticeshr(uu, 95, standardize=TRUE)
##D              plot(pc, xlim=c(510000, 530000),
##D                   ylim=c(6810000, 6825000))
##D              title(main=vv[i])
##D              })
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ##################################################
##D ##
##D ## Example with several wild boars (linear time)
##D 
##D ## load wild boar data
##D data(puechcirc)
##D 
##D 
##D ## keep only the first two circuits:
##D puechc <- puechcirc[1:2]
##D 
##D 
##D ## Now load the map of the elevation
##D data(puechabonsp)
##D 
##D 
##D ## compute the time point at which the UD is to be estimated
##D vv <- seq(min(puechcirc[[2]]$date), max(puechcirc[[2]]$date),
##D           length=50)
##D 
##D 
##D ## The estimate the UD
##D re <- lapply(1:length(vv),
##D              function(i) {
##D 
##D                  ## We choose a smoothing parameter of 300 meters for
##D                  ## the x and y coordinates and of one hour for the time
##D                  ## (but try to play with these smoothing parameters)
##D 
##D                  uu <- kernelkc(puechcirc, h=c(300,300,3600),
##D                                 tcalc = vv[i], same4all=TRUE,
##D                                 extent=0.1)
##D 
##D                  ## show the elevation
##D                  image(puechabonsp$map, 
##D                        xlim=c(698000,704000),
##D                        ylim=c(3156000,3160000))
##D                  title(main=vv[i])
##D 
##D                  ## and the UD, with contour lines
##D                  colo <- c("green","blue")
##D                  lapply(1:length(uu), function(i) {
##D                         contour(as(uu[[i]],"SpatialPixelsDataFrame"),
##D                                 add=TRUE, col=colo[i])
##D                  })
##D 
##D                  ## the blue contour lines show the UD of the mother and
##D                  ## the red ones correspond to her son. Adult wild boars
##D                  ## are known to be more "shy" that the youger ones.
##D                  ## Here, the low elevation corresponds to crop area
##D                  ## (vineyards). The young boar is the first and the
##D                  ## last in the crops
##D              })
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ##################################################
##D ##
##D ## Example with the bear, to illustrate (circular time)
##D 
##D data(bear)
##D 
##D ## We consider a time cycle of 24 hours.
##D ## the following vector contains the time points on the
##D ## time circle at which the UD is to be estimated (note that
##D ## the time is given in seconds)
##D vv <- seq(0, 24*3600-1, length=40)
##D 
##D 
##D ## for each time point:
##D re <- lapply(1:length(vv),
##D              function(i) {
##D 
##D                  ## Estimation of the UD for the bear. We choose
##D                  ## a smoothing parameter of 1000 meters for the spatial
##D                  ## coordinates and a smoothing parameter equal to 0.2
##D                  ## for the time. We set the beginning of the time
##D                  ## cycle at midnight (no particular reason, just to
##D                  ## illustrate the function). So we pass, as t0, any
##D                  ## object of class POSIXct corresponding t a date at
##D                  ## this hour, for example the 12/25/2012 at 00H00
##D                  t0 <- as.POSIXct("2012-12-25 00:00")
##D                  uu <- kernelkc(bear, h=c(1000,1000,0.2), cycle=24*3600,
##D                                  tcalc=vv[i], t0=t0, circular=TRUE)
##D 
##D                  ## shows the results
##D                  ## first compute the hour for the title
##D                  hour <- paste(floor(vv[i]/3600), "hours",
##D                                floor((vv[i]%%3600)/60), "min")
##D 
##D                  ## compute the 95% home range
##D                  pc <- getverticeshr(uu, 95, standardize=TRUE)
##D                  plot(pc, xlim=c(510000, 530000),
##D                       ylim=c(6810000, 6825000))
##D                  title(main=hour)
##D 
##D                  ## compute the 50% home range
##D                  pc <- getverticeshr(uu, 50, standardize=TRUE)
##D                  plot(pc, add=TRUE, col="blue")
##D                  
##D              })
##D  ## Now, each home range computed at a given time point corresponds to
##D  ## the area used by the animal at this time period.  We may for example
##D  ## try to identify the main difference in habitat composition of the
##D  ## home-range between different time, to identify differences in
##D  ## habitat use between different time of the day. We do not do it here
##D  ## (lack of example data)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D ##################################################
##D ##
##D ## Example of the use of the function kernelkcbase and
##D ## related functions
##D 
##D 
##D ## load the data
##D data(puechabonsp)
##D locs <- puechabonsp$relocs
##D 
##D ## keeps only the wild boar Jean
##D locs <- locs[slot(locs, "data")[,1]=="Jean",]
##D 
##D ## compute the number of days since the beginning
##D ## of the monitoring
##D dd <- cumsum(c(0, diff(strptime(slot(locs, "data")[,4], "%y%m%d"))))
##D dd
##D 
##D ## compute xyt. Note that t is here the number of
##D ## days since the beginning of the monitoring (it
##D ## is not an object of class POSIXt, but it may be)
##D xyt <- data.frame(as.data.frame(coordinates(locs)), dd)
##D 
##D ## Now compute the time points at which the UD is to be estimated:
##D vv <- 1:61
##D 
##D ## and finally, show the UD changed with time:
##D re <- lapply(1:length(vv),
##D              function(i) {
##D                  ud <- kernelkcbase(xyt, h=c(300,300,20), 
##D                                     tcalc=vv[i], grid=100)
##D                  image(ud, main=vv[i])
##D                  plot(getverticeshr(ud, 95, standardize=TRUE),
##D                        border="red", lwd=2, add=TRUE)
##D 
##D                  ## Just to slow down the process
##D                  Sys.sleep(0.2)
##D                  })
##D 
##D 
##D 
## End(Not run)






