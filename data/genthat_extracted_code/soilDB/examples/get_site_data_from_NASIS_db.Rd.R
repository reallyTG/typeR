library(soilDB)


### Name: get_site_data_from_NASIS_db
### Title: Extract Site Data from a local NASIS Database
### Aliases: get_site_data_from_NASIS_db
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D ## Example: export / convert DMS coordinates from NASIS and save to DD import file
##D 
##D # load required libraries
##D library(soilDB)
##D library(rgdal)
##D library(plyr)
##D 
##D # get site data from NASIS
##D s <- get_site_data_from_NASIS_db()
##D 
##D # keep only those pedons with real coordinates
##D good.idx <- which(!is.na(s$x))
##D s <- s[good.idx, ]
##D 
##D # investigate multiple datums:
##D get_site_data_from_NASIS_db
##D 
##D ## this is not universally appropriate!
##D # assume missing is NAD83 
##D s$horizdatnm[is.na(s$horizdatnm)] <- 'NAD83'
##D 
##D # check: OK
##D table(s$horizdatnm, useNA='always')
##D 
##D # convert to NAD83
##D old.coords <- cbind(s$x, s$y)
##D 
##D # add temp column for projection information, and fill with proj4 style info
##D s$proj4 <- rep(NA, times=nrow(s))
##D s$proj4 <- paste('+proj=longlat +datum=', s$horizdatnm, sep='')
##D 
##D # iterate over pedons, and convert to WGS84
##D new.coords <- ddply(s, 'siteiid', 
##D   .progress='text', .fun=function(i) {
##D     coordinates(i) <- ~ x + y
##D     proj4string(i) <- CRS(i$proj4)
##D     i.t <- spTransform(i, CRS('+proj=longlat +datum=WGS84'))
##D     i.c <- as.matrix(coordinates(i.t))
##D     return(data.frame(x.new=i.c[, 1], y.new=i.c[, 2]))
##D   })
##D 
##D # merge in new coordinates
##D s <- join(s, new.coords)
##D 
##D # any changes?
##D summary(sqrt(apply((s[, c('x', 'y')] - s[, c('x.new', 'y.new')])^2, 1, sum)))
##D 
##D # save to update file for use with "Import of Standard WGS84 Georeference" calculation in NASIS
##D # note that this defines the coordinate source as "GPS", hence the last column of '1's.
##D std.coordinates.update.data <- unique(cbind(s[, c('siteiid', 'y.new', 'x.new')], 1))
##D # save to file
##D write.table(std.coordinates.update.data, 
##D file='c:/data/sgeoref.txt', col.names=FALSE, row.names=FALSE, sep='|')
## End(Not run)


