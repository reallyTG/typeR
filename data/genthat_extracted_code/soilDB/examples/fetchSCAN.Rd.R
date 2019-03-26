library(soilDB)


### Name: fetchSCAN
### Title: Fetch SCAN Data
### Aliases: fetchSCAN SCAN_sensor_metadata SCAN_site_metadata
### Keywords: manip

### ** Examples

## Not run: 
##D # get data: new interface
##D x <- fetchSCAN(site.code=c(356, 2072), year=c(2015, 2016))
##D str(x)
##D 
##D # get sensor metadata
##D m <- SCAN_sensor_metadata(site.code=c(356, 2072))
##D 
##D # get site metadata
##D m <- SCAN_site_metadata(site.code=c(356, 2072))
## End(Not run)



