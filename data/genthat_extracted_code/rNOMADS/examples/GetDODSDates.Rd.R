library(rNOMADS)


### Name: GetDODSDates
### Title: Find available model run dates for data on the GrADS - DODS
###   system.
### Aliases: GetDODSDates
### Keywords: utilities

### ** Examples


#An example for the Global Forecast System 0.5 degree model

#Get the latest model url and date
abbrev <- "gfs_0p50"
## Not run: 
##D urls.out <- GetDODSDates(abbrev)
##D print(paste("Most recent model run:",tail(urls.out$date, 1)))
##D 
##D #Get model dates from the GFS archive
##D abbrev <- "gfs-avn-hi"
##D urls.out <- GetDODSDates(abbrev, archive = TRUE, request.sleep = 1)
## End(Not run)




