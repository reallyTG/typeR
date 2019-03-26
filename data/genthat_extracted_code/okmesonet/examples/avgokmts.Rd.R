library(okmesonet)


### Name: avgokmts
### Title: Average an Oklahoma Mesonet time series data frame
### Aliases: avgokmts

### ** Examples

## Not run: 
##D ## Retrieve Bessie station MTS files for 00:00 Jun 01, 1997
##D ## through 23:55 Oct 31, 1997
##D bess.mts <- okmts(begintime="1997-06-01 00:00:00",
##D  endtime="1997-10-31 23:55", station="bess")
##D 
##D ## Average MTS data by day.
##D bess.mts.avg  <- avgokmts(bess.mts, by="day")
## End(Not run)



