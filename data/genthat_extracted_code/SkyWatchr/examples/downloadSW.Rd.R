library(SkyWatchr)


### Name: downloadSW
### Title: Download satellite imagery and climate/atmospheric datasets
###   using the SkyWatch API
### Aliases: downloadSW
### Keywords: spatial

### ** Examples

## Not run: 
##D api_key <- "your_personal_alphanumeric_api_key"
##D 
##D # Set the SkyWatchr.apikey option 
##D options(SkyWatchr.apikey = api_key)
##D 
##D res <- querySW(time_period = "2015-06", longitude_latitude = "48.676074,31.321119", 
##D                data_level = 3)
##D View(res)
##D 
##D # Download all files
##D downloadSW(res)
##D 
##D # Download a subset
##D downloadSW(res[c(1,3), ])
##D 
##D # Use an expresion to subset files to be downloaded
##D downloadSW(res, source == "MOPITT" & size_kb < 2400)
## End(Not run)



