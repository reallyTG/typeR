library(IRISSeismic)


### Name: psdList
### Title: Apply McNamara PSD algorithm to a seismic signal
### Aliases: psdList
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
##D # Plot uncorrected PSDs
##D period <- 1/psdList[[1]]$freq
##D plot(period, psdList[[1]]$spec, log='x', type='l',
##D      xlab="Period (Sec)", ylab="Power (dB)",
##D      main="Uncorrected PSDs")
##D      
##D for (i in seq(2:length(psdList))) {
##D   points(period, psdList[[i]]$spec, type='l')
##D }
## End(Not run)



