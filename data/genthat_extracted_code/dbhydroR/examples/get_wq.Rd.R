library(dbhydroR)


### Name: get_wq
### Title: Retrieve water quality data from the DBHYDRO Environmental
###   Database
### Aliases: get_wq getwq

### ** Examples


#one variable and one station
get_wq(station_id = "FLAB08",
date_min = "2011-03-01", date_max = "2012-05-01",
test_name = "CHLOROPHYLLA-SALINE")

## Not run: 
##D #one variable at multiple stations
##D get_wq(station_id = c("FLAB08", "FLAB09"),
##D date_min = "2011-03-01", date_max = "2012-05-01",
##D test_name = "CHLOROPHYLLA-SALINE")
##D 
##D #One variable at a wildcard station
##D get_wq(station_id = c("FLAB0%"),
##D date_min = "2011-03-01",
##D date_max = "2012-05-01",
##D test_name = "CHLOROPHYLLA-SALINE")
##D 
##D #multiple variables at multiple stations
##D get_wq(station_id = c("FLAB08", "FLAB09"),
##D date_min = "2011-03-01", date_max = "2012-05-01",
##D test_name = c("CHLOROPHYLLA-SALINE", "SALINITY"))
## End(Not run)



