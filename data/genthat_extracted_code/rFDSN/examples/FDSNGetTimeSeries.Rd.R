library(rFDSN)


### Name: FDSNGetTimeSeries
### Title: Download sensor time series from FDSN.
### Aliases: FDSNGetTimeSeries
### Keywords: connection

### ** Examples


## Not run: 
##D 
##D #Download pressure data at station Y22D on August 9, 2014
##D 
##D #IRIS data download server
##D base.url <- "http://service.iris.edu/fdsnws/dataselect/1/"
##D parameters <- list(
##D     name = c(
##D     "sta",
##D     "cha",
##D     "start",
##D     "end"),
##D     value = c(
##D     "Y22D", #Station name
##D     "BDF", #SEED channel name
##D     "2014-08-09T00:00:00.000", #Midnight GMT
##D     "2014-08-09T23:59:59.999") #Midnight GMT
##D    )
##D miniseed.file <- FDSNGetTimeSeries(base.url, parameters, save.file = "Y22D_BDF.mseed")
##D 
##D 
## End(Not run)



