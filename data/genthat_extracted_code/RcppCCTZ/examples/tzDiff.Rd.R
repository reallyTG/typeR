library(RcppCCTZ)


### Name: tzDiff
### Title: Return difference between two time zones at a given date.
### Aliases: tzDiff

### ** Examples

## Not run: 
##D # simple call: difference now
##D tzDiff("America/New_York", "Europe/London", Sys.time())
##D # tabulate difference for every week of the year
##D table(sapply(0:52, function(d) tzDiff("America/New_York", "Europe/London",
##D                                       as.POSIXct(as.Date("2016-01-01") + d*7))))
## End(Not run)



