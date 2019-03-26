library(incadata)


### Name: as.Dates
### Title: Converting potential date to Date vector
### Aliases: as.Dates

### ** Examples


as.Dates(c(1212121212, "20000101", "2014-10-15", 5806))

## Not run: 
##D # Note that the as.Date (as oppose to as.Dates)
##D # does not handle missing dates as empty strings
##D as.Date(c("", "2017-02-16")) # Error
##D as.Dates(c("", "2017-02-16")) # NA "2017-02-16"
## End(Not run)



