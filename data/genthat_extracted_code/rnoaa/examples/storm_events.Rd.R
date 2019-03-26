library(rnoaa)


### Name: storm_events
### Title: NOAA Storm Events data
### Aliases: storm_events se_data se_files

### ** Examples

## Not run: 
##D # get list of files and their urls
##D res <- se_files()
##D res
##D tail(res)
##D 
##D # get data
##D x <- se_data(year = 2013, type = "details")
##D x
##D 
##D z <- se_data(year = 1988, type = "fatalities")
##D z
##D 
##D w <- se_data(year = 2003, type = "locations")
##D w
##D 
##D leg <- se_data(year = 2003, type = "legacy")
##D leg
## End(Not run)



