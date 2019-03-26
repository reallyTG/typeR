library(rerddap)


### Name: convert_time
### Title: Convert a UDUNITS compatible time to ISO time
### Aliases: convert_time

### ** Examples

 ## Not run: 
##D # local conversions
##D convert_time(n = 473472000)
##D convert_time(isoTime = "1985-01-02T00:00:00Z")
##D 
##D # using an erddap web service
##D convert_time(n = 473472000, method = "web")
##D convert_time(isoTime = "1985-01-02T00:00:00Z", method = "web")
## End(Not run)



