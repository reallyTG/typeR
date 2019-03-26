library(clifro)


### Name: summary,cfWind-method
### Title: Summarise Clifro Wind Data
### Aliases: summary,cfWind-method

### ** Examples

## Not run: 
##D # Retrieve maximum wind gust data at the Reefton Ews station from CliFlo
##D # (public data)
##D reefton_wind = cf_query(cf_user(), cf_datatype(2, 2, 1, 1), cf_station(),
##D                         start_date = "2012-01-01-00")
##D 
##D class(reefton_wind) # cfWind object
##D 
##D # Summarise the information
##D summary(reefton_wind)
## End(Not run)



