library(dataRetrieval)


### Name: readNWISmeas
### Title: Surface-water measurement data retrieval from USGS (NWIS)
### Aliases: readNWISmeas

### ** Examples

site_ids <- c('01594440','040851325')
## Not run: 
##D data <- readNWISmeas(site_ids)
##D Meas05316840 <- readNWISmeas("05316840")
##D Meas05316840.ex <- readNWISmeas("05316840",expanded=TRUE)
##D Meas07227500.ex <- readNWISmeas("07227500",expanded=TRUE)
##D Meas07227500.exRaw <- readNWISmeas("07227500",expanded=TRUE, convertType = FALSE)
## End(Not run)



