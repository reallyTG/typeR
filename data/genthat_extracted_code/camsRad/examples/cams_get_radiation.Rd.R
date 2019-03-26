library(camsRad)


### Name: cams_get_radiation
### Title: Retrieve CAMS solar radiation data
### Aliases: cams_get_radiation

### ** Examples

## Not run: 
##D # Get hourly solar radiation data
##D df <- cams_get_radiation(
##D   lat=60, lng=15,
##D   date_begin="2016-06-01", date_end="2016-06-15")
##D head(df)
##D 
##D # Get daily solar radiation data
##D df <- cams_get_radiation(
##D   lat=60, lng=15,
##D   date_begin="2016-06-01", date_end="2016-06-15",
##D   time_step="P01D")
##D head(df)
## End(Not run)




