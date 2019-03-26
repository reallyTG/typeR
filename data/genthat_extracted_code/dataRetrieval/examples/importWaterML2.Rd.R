library(dataRetrieval)


### Name: importWaterML2
### Title: Parse the WaterML2 timeseries portion of a waterML2 file
### Aliases: importWaterML2

### ** Examples

baseURL <- "https://waterservices.usgs.gov/nwis/dv/?format=waterml,2.0"
URL <- paste(baseURL, "sites=01646500",
     "startDT=2014-09-01",
     "endDT=2014-09-08",
     "statCd=00003",
     "parameterCd=00060",sep="&")
## Not run: 
##D timesereies <- importWaterML2(URL, asDateTime=TRUE, tz="UTC")
## End(Not run) 



