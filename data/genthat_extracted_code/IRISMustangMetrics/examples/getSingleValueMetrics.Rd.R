library(IRISMustangMetrics)


### Name: getSingleValueMetrics
### Title: Retrieve measurements from the MUSTANG BSS
### Aliases: getSingleValueMetrics
###   getSingleValueMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character,character,character-method
###   getSingleValueMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character,character,missing-method
###   getSingleValueMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character,missing,character-method
###   getSingleValueMetrics,IrisClient,character,character,character,character,POSIXct,POSIXct,character,missing,missing-method
### Keywords: webservices

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices (including the BSS)
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D starttime <- as.POSIXct("2013-06-01", tz="GMT")
##D endtime <- starttime + 30*24*3600
##D metricName <- "sample_max,sample_min,sample_mean"
##D 
##D # Get the measurement dataframe
##D juneStats <- getSingleValueMetrics(iris,"IU","ANMO","00","BHZ",
##D                                         starttime,endtime,metricName)
##D 
##D head(juneStats)
##D 
##D # Simple ggplot2 plot
##D #library(ggplot2)
##D #p <- ggplot(juneStats, aes(x=starttime,y=value, color=as.factor(metricName))) +
##D #     geom_step()
##D 
##D #print(p)
##D   
## End(Not run)



