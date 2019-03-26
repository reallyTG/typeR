library(RcppCCTZ)


### Name: toTz
### Title: Shift datetime object from one timezone to another
### Aliases: toTz

### ** Examples

## Not run: 
##D toTz(Sys.time(), "America/New_York", "Europe/London")
##D # this redoes the 'Armstrong on the moon in NYC and Sydney' example
##D toTz(ISOdatetime(1969,7,20,22,56,0,tz="UTC"), "America/New_York", "Australia/Sydney", verbose=TRUE)
##D # we can also explicitly format for Sydney time 
##D format(toTz(ISOdatetime(1969,7,20,22,56,0,tz="UTC"), 
##D             "America/New_York", "Australia/Sydney", verbose=TRUE), 
##D        tz="Australia/Sydney")
## End(Not run)



