library(dataRetrieval)


### Name: readNWISpeak
### Title: Peak flow data from USGS (NWIS)
### Aliases: readNWISpeak

### ** Examples

site_ids <- c('01594440','040851325')
## Not run: 
##D data <- readNWISpeak(site_ids)
##D data2 <- readNWISpeak(site_ids, asDateTime=FALSE)
##D stations<-c("06011000")
##D peakdata<-readNWISpeak(stations,convertType=FALSE)
## End(Not run)



