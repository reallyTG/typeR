library(RJSDMX)


### Name: getTimeSeriesRevisions
### Title: get data revisions
### Aliases: getTimeSeriesRevisions

### ** Examples

## Not run: 
##D   # get single time series with history:
##D   my_ts=getTimeSeriesRevisions('ECB','EXR.A.USD.EUR.SP00.A', includeHistory=TRUE)
##D 
##D   # get single time series (only observations updated after january 1st 2015):
##D   my_ts=getTimeSeriesRevisions('ECB','EXR.A.USD.EUR.SP00.A',
##D                    updatedAfter='2015', includeHistory=FALSE)
##D 
##D   # get single time series (full revision history starting from january 1st 2015):
##D   my_ts=getTimeSeriesRevisions('ECB','EXR.A.USD.EUR.SP00.A', 
##D                    updatedAfter='2015', includeHistory=TRUE)
## End(Not run)



