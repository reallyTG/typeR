library(sbtools)


### Name: query_sb_date
### Title: Query SB for items within a date range
### Aliases: query_sb_date

### ** Examples

## Not run: 
##D # find items updated today
##D query_sb_date(Sys.time(), Sys.time())
##D 
##D # find items with publications from the 1970's
##D query_sb_date(as.POSIXct('1970-01-01'), as.POSIXct('1980-01-01'), 
##D   date_type='Publication', limit=1000)
##D 
## End(Not run)




