library(trip)


### Name: trip-methods
### Title: Function to handle animal track data, organized as '"trip"'s
### Aliases: [,trip,ANY,ANY,ANY-method [,trip-method
###   [[<-,trip,ANY,missing-method trip trip,ANY,TimeOrderedRecords-method
###   trip,SpatialPointsDataFrame,ANY-method trip,trip,ANY-method
###   trip,trip,TimeOrderedRecords-method trip-methods trip<-
###   trip<-,data.frame,character-method

### ** Examples



d <- data.frame(x=1:10, y=rnorm(10), tms=Sys.time() + 1:10, id=gl(2, 5))
coordinates(d) <- ~x+y
## this avoids complaints later, but these are not real track data (!)
proj4string(d) <- CRS("+proj=laea +ellps=sphere")
(tr <- trip(d, c("tms", "id")))

## don't want adehabitatMA to be loaded as a requirement here
## Not run: 
##D ## a simple example with the common fixes required for basic track data
##D 
##D dat <- read.csv("trackfile.csv")
##D names(dat)  ## e.g. [1] "long" "lat" "seal" "date" "local" "lq"
##D library(sp)
##D coordinates(dat) <- c("long", "lat")
##D 
##D ## date/times may be in a particular time zone, please check
##D dat$gmt <- as.POSIXct(strptime(paste(dat$date, dat$local),
##D                       "%d-%b-%y %H:%M:%S"), tz="GMT")
##D 
##D ## if there are problems in the data, this will error
##D tr <- trip(dat, c("gmt", "seal"))
##D 
##D ## the following code tries to fix common problems
##D 
##D ## remove completely-duplicated rows
##D dat <- dat[!duplicated(dat), ]
##D ## order the rows by seal, then by time
##D dat <- dat[order(dat$seal, dat$gmt), ]
##D ## fudge duplicated times
##D dat$gmt <- adjust.duplicateTimes(dat$gmt, dat$seal)
##D 
##D ## finally, convert to Spatial and create trip object
##D coordinates(dat) <- c("long", "lat")
##D tr <- trip(dat, c("gmt", "seal"))
## End(Not run)


## Not run: 
##D    if (require(adehabitatLT)) {
##D      data(porpoise)
##D      porpoise <- as.trip(porpoise)
##D      proj4string(porpoise) <- CRS("+proj=utm +zone=21 +ellps=WGS84 +units=m +no_defs")
##D      summary(porpoise)
##D 
##D    }
##D 
##D 
##D    ## extended example to check that our projection metadata is correct
##D    library(maptools)
##D    data(wrld_simpl)
##D    library(rgeos)
##D    library(raster)
##D 
##D    ## 3 degrees either side (for half a zone . . .)
##D    ext <- as(extent(spTransform(porpoise, CRS(proj4string(wrld_simpl)))) + 3, "SpatialPolygons")
##D    proj4string(ext) <- CRS(proj4string(wrld_simpl))
##D    ## crop to the buffered tracks, and project to its native CRS
##D    w <- spTransform(gIntersection(wrld_simpl[grep("United States", wrld_simpl$NAME), ], ext),
##D     CRS(proj4string(porpoise)))
##D 
##D    plot(w)
##D    lines(porpoise)
## End(Not run)



