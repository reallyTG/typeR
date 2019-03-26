library(dataRetrieval)


### Name: readNWISgwl
### Title: Groundwater level measurements retrieval from USGS (NWIS)
### Aliases: readNWISgwl

### ** Examples

site_id <- "434400121275801"
## Not run: 
##D data <- readNWISgwl(site_id, '','')
##D sites <- c("434400121275801", "375907091432201")
##D data2 <- readNWISgwl(site_id, '','')
##D data3 <- readNWISgwl("420125073193001", '','')
##D #handling of data where date has no day
##D data4 <- readNWISgwl("425957088141001", startDate = "1980-01-01") 
## End(Not run)



