library(PWFSLSmoke)


### Name: monitorGoogleMap
### Title: Create a Google Map of ws_monitor Object
### Aliases: monitorGoogleMap
### Keywords: ws_monitor

### ** Examples

## Not run: 
##D N_M <- Northwest_Megafires
##D # monitorLeaflet(N_M) # to identify Spokane monitorIDs
##D Spokane <- monitor_subsetBy(N_M, stringr::str_detect(N_M$meta$monitorID,'^53063'))
##D Spokane <- monitor_subset(Spokane, tlim=c(20150815, 20150831))
##D monitorGoogleMap(Spokane)
## End(Not run)



