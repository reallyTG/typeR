library(dbhydroR)


### Name: get_dbkey
### Title: Query dbkey information
### Aliases: get_dbkey getdbkey

### ** Examples

## Not run: 
##D # Weather
##D get_dbkey(stationid = "JBTS", category = "WEATHER", param = "WNDS",
##D detail.level = "summary")
##D get_dbkey(stationid = "JBTS", category = "WEATHER", param = "WNDS",
##D detail.level = "dbkey")
##D 
##D # query on multiple values
##D get_dbkey(stationid = c("MBTS", "JBTS"), category = "WEATHER",
##D param = "WNDS", freq = "DA", detail.level = "dbkey")
##D 
##D 
##D # Surfacewater
##D get_dbkey(stationid = "C111%", category = "SW")
##D get_dbkey(category = "SW", stationid = "LAKE%", detail.level = "full")
##D 
##D # Groundwater
##D get_dbkey(stationid = "C111%", category = "GW")
##D get_dbkey(stationid = "C111AE", category = "GW", param = "WELL",
##D freq = "DA", stat = "MEAN", strata = c(9, 22), recorder = "TROL",
##D  agency = "WMD", detail.level = "full")
##D 
##D # Water Quality
##D get_dbkey(stationid = "C111%", category = "WQ")
## End(Not run)



