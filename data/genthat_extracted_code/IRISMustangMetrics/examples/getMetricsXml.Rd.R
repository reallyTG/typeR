library(IRISMustangMetrics)


### Name: getMetricsXml
### Title: Retrieve measurements XML from the MUSTANG BSS
### Aliases: getMetricsXml
###   getMetricsXml,IrisClient,character,character,character,character,POSIXct,POSIXct,character,character-method
###   getMetricsXml,IrisClient,character,character,character,character,POSIXct,POSIXct,character,missing-method
### Keywords: webservices

### ** Examples

# Open a connection to IRIS DMC webservices (including the BSS)
iris <- new("IrisClient", debug=TRUE)

starttime <- as.POSIXct("2012-01-24", tz="GMT")
endtime <- as.POSIXct("2012-01-25", tz="GMT")

# Get the measurement XML
xml <- getMetricsXml(iris,"AK","PIN","","BHZ",
                          starttime,endtime,metricName="sample_mean",
                          url="http://service.iris.edu/mustang/measurements/1/query?")



