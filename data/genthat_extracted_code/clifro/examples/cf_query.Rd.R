library(clifro)


### Name: cf_query
### Title: Retrieve Data from the National Climate Database
### Aliases: cf_query

### ** Examples

## Not run: 
##D # Retrieve daily rain data from Reefton Ews
##D daily.rain = cf_query(cf_user("public"), cf_datatype(3, 1, 1),
##D                       cf_station(), "2012-01-01 00")
##D daily.rain
##D 
##D # returns a cfData object as there is only one datatype
##D class(daily.rain) # 'cfRain' object - inherits 'cfData'
##D 
##D # Look up the help page for cfRain plot methods
##D ?plot.cfRain
##D 
##D # Retrieve daily rain and wind data from Reefton Ews
##D 
##D daily.dts = cf_query(cf_user("public"),
##D                      cf_datatype(c(2, 3), c(1, 1), list(4, 1), c(1, NA)),
##D                      cf_station(), "2012-01-01 00", "2013-01-01 00")
##D daily.dts
##D 
##D # returns a cfDataList object as there is more than one datatype. Each
##D # element of the cfDataList is an object inheriting from the cfData class.
##D class(daily.dts)     # cfDataList
##D class(daily.dts[1])  # cfRain
##D class(daily.dts[2])  # cfWind
##D 
##D # Create a cfSunshine object (inherits cfData)
##D # Retrieve daily global radiation data at Reefton Ews
##D rad.data = cf_query(cf_user(), cf_datatype(5,2,1), cf_station(),
##D                     "2012-01-01 00")
##D rad.data
##D 
##D # The cf_query function automatically creates the appropriate cfData subclass
##D class(rad.data)
##D 
##D # The advantage of having these subclasses is that it makes plotting very easy
##D plot(rad.data)
##D plot(daily.rain)
##D plot(daily.rain, include_runoff = FALSE)
##D plot(daily.dts)
##D plot(daily.dts, 2)
## End(Not run)



