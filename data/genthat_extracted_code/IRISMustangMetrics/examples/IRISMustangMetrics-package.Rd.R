library(IRISMustangMetrics)


### Name: IRISMustangMetrics-package
### Title: Utilities for calculating seismic metrics from IRIS DMC data
### Aliases: IRISMustangMetrics-package IRISMustangMetrics

### ** Examples

# Open a connection to IRIS DMC webservices
iris <- new("IrisClient", debug=TRUE)

# Get the seismic data
starttime <- as.POSIXct("2010-02-27 06:45:00",tz="GMT")
endtime <- as.POSIXct("2010-02-27 07:45:00",tz="GMT")
st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)

# Apply a metric and show the results
metricList <- basicStatsMetric(st)
dummy <- lapply(metricList, show)



