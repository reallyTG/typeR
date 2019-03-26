library(countyfloods)


### Name: run_flood
### Title: Return flood metrics by county codes or state names
### Aliases: run_flood

### ** Examples

## Not run: 
##D #Use Q2 as flood threshold and get get gage-level output
##D va_floods <- run_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "Q2",
##D                       output = "gage")
##D 
##D #Use NWS flood thresholds and get county-level output
##D va_floods <- run_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "NWS",
##D                       flood_type = "action",
##D                       output = "county")
## End(Not run)



