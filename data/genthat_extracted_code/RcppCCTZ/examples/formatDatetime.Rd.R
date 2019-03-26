library(RcppCCTZ)


### Name: formatDatetime
### Title: Format a Datetime vector as a string vector
### Aliases: formatDatetime formatDouble

### ** Examples

## Not run: 
##D now <- Sys.time()
##D formatDatetime(now)            # current (UTC) time, in full precision RFC3339
##D formatDatetime(now, tgttzstr="America/New_York")  # same but in NY
##D formatDatetime(now + 0:4)	   # vectorised
## End(Not run)



