library(countyfloods)


### Name: map_flood
### Title: Function maps data, either by gage or by county
### Aliases: map_flood

### ** Examples

## Not run: 
##D #Use Q2 as flood threshold and get get gage-level output
##D va_floods <- run_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "Q2", output = "gage")
##D #Map results by gage
##D map_flood(va_floods)
##D 
##D 
##D #Use NWS flood thresholds and get county-level output
##D va_floods <- run_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "NWS", flood_type = "action",
##D                       output = "county")
##D #Map results by county
##D map_flood(va_floods)
## End(Not run)



