library(IRISSeismic)


### Name: psdStatistics
### Title: Return statistics for a set of PSDs
### Aliases: psdStatistics
### Keywords: spectra

### ** Examples

## Not run: 
##D # Create a new IrisClient
##D iris <- new("IrisClient", debug=TRUE)
##D 
##D # Get seismic data
##D starttime <- as.POSIXct("2011-05-05", tz="GMT") # 2011.125
##D endtime <- starttime + 1*24*3600
##D st <- getDataselect(iris,"IU","GRFO","--","BHE",starttime,endtime)
##D 
##D # Generate power spectral density for each hour long segment
##D psdList <- psdList(st)
##D 
##D # Generate Statistics
##D stats <- psdStatistics(psdList)
##D 
##D # Just for fun plot
##D logPeriod <- log10(1/stats$freq)
##D plot(logPeriod,stats$max,ylim=c(-200,-50), las=1,
##D      xlab="log10(period)", ylab="Power (dB)",
##D      main="Model 'normal background noise' area and area of seismic signal.")
##D points(logPeriod,stats$min)
##D 
##D # Overlay a polygon showing the range between the noise models
##D x <- c(logPeriod,rev(logPeriod),logPeriod[1])
##D y <- c(stats$nhnm,rev(stats$nlnm),stats$nhnm[1])
##D transparentBlack <- adjustcolor('black',0.4)
##D polygon(x,y,col=transparentBlack)
##D 
##D # Overlay a polygon showing the range of measured values
##D y <- c(stats$max,rev(stats$min),stats$max[1])
##D transparentBlue <- adjustcolor('blue',0.6)
##D polygon(x,y,col=transparentBlue)  
## End(Not run)



