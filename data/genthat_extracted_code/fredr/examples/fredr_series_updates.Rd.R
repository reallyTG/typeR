library(fredr)


### Name: fredr_series_updates
### Title: Get a set of recently updated FRED series
### Aliases: fredr_series_updates

### ** Examples

## No test: 
# Get all recently updated "regional" series
fredr_series_updates(filter_value = "regional")
# Most recently udpated series are returned first
updates <- fredr_series_updates(filter_value = "regional")$last_updated
is.unsorted(rev(as.POSIXct(updates)))
## End(No test)



