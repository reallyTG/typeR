library(countyfloods)


### Name: time_series_flood
### Title: Return a time series of flood metrics by county codes or state
###   names
### Aliases: time_series_flood

### ** Examples

## Not run: 
##D #Use Q2 as flood threshold
##D va_time_series <- time_series_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "Q2")
##D 
##D #Use NWS flood thresholds
##D va_time_series <- time_series_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "NWS",
##D                       flood_type = "action")
## End(Not run)



