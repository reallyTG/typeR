library(IRISMustangMetrics)


### Name: createBssUrl
### Title: Create URL to retrieve measurements from the MUSTANG BSS
### Aliases: createBssUrl
###   createBssUrl,IrisClient,character,character,character,character,POSIXct,POSIXct,character-method
### Keywords: webservices

### ** Examples

# Open a connection to IRIS DMC webservices (including the BSS)
iris <- new("IrisClient", debug=TRUE)

starttime <- as.POSIXct("2013-06-01", tz="GMT")
endtime <- starttime + 30*24*3600
metricName <- "sample_max,sample_min,sample_mean"

# Get the measurement dataframe
url <- createBssUrl(iris,"IU","ANMO","00","BHZ",
                    starttime,endtime,metricName)

# This URL can be pasted into a web browser to see the BSS return values



