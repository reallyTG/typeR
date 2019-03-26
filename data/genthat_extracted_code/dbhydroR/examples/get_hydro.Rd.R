library(dbhydroR)


### Name: get_hydro
### Title: Retrieve hydrologic data from the DBHYDRO Environmental Database
### Aliases: get_hydro gethydro

### ** Examples

## Not run: 
##D #One variable/station time series
##D get_hydro(dbkey = "15081", date_min = "2013-01-01", date_max = "2013-02-02")
##D 
##D #Multiple variable/station time series
##D get_hydro(dbkey = c("15081", "15069"),
##D date_min = "2013-01-01", date_max = "2013-02-02")
##D 
##D #Instantaneous hydro retrieval
##D get_hydro(dbkey = "IY639", date_min = "2015-11-01", date_max = "2015-11-04")
##D 
##D #Looking up unknown dbkeys on the fly
##D get_hydro(stationid = "JBTS", category = "WEATHER",
##D param = "WNDS", freq = "DA", date_min = "2013-01-01",
##D date_max = "2013-02-02")
## End(Not run)



