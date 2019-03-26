library(IRISMustangMetrics)


### Name: getMustangMetrics
### Title: Retrieve measurements from the MUSTANG BSS
### Aliases: getMustangMetrics
###   getMustangMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character-method
### Keywords: webservices

### ** Examples

# Open a connection to IRIS DMC webservices (including the BSS)
iris <- new("IrisClient", debug=TRUE)

starttime <- as.POSIXct("2016-08-01", tz="GMT")
endtime <- starttime + 30*24*3600
metricName <- "sample_max,sample_mean,orientation_check"

# Get the measurement dataframe
juneStats <- getMustangMetrics(iris,"IU","ANMO","","BH[12Z]",
                                        starttime,endtime,metricName)

print(juneStats)



