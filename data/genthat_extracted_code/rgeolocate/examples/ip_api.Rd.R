library(rgeolocate)


### Name: ip_api
### Title: Geolocate IP Addresses Through ip-api.com
### Aliases: ip_api

### ** Examples

## Not run: 
##D #Valid, data.frame output
##D result <- ip_api("2607:FB90:426:DC1D:CFC4:4875:8BC2:4D93")
##D 
##D #Invalid, data.frame output
##D result <- ip_api("argh")
##D 
##D #Valid list output
##D result <- ip_api("2607:FB90:426:DC1D:CFC4:4875:8BC2:4D93", as_data_frame = FALSE)
##D 
##D #Invalid list output
##D result <- ip_api("argh", as_data_frame = FALSE)
## End(Not run)



