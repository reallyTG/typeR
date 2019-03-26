library(oce)


### Name: ctdTrim
### Title: Trim Beginning and Ending of a CTD cast
### Aliases: ctdTrim

### ** Examples

## Not run: 
##D library(oce)
##D data(ctdRaw)
##D plot(ctdRaw) # barely recognizable, due to pre- and post-cast junk
##D plot(ctdTrim(ctdRaw)) # looks like a real profile ...
##D plot(ctdDecimate(ctdTrim(ctdRaw),method="boxcar")) # ... smoothed
##D # Demonstrate use of a function. The scan limits were chosen
##D # by using locator(2) on a graph made by plotScan(ctdRaw).
##D trimByIndex<-function(data, parameters) {
##D   parameters[1] < data$scan & data$scan < parameters[2]
##D }
##D trimmed <- ctdTrim(ctdRaw, trimByIndex, parameters=c(130, 380))
##D plot(trimmed)
## End(Not run)




