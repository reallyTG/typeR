library(IRISSeismic)


### Name: psdList2NoiseMatrix
### Title: Apply instrument correction to PSDs
### Aliases: psdList2NoiseMatrix
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
##D # Convert into corrected "noiseMatrix"
##D noiseMatrix <- psdList2NoiseMatrix(psdList)
##D 
##D # Plot corrected PSDs
##D period <- 1/psdList[[1]]$freq
##D plot(period, noiseMatrix[1,], log='x', type='l',
##D      ylim=c(-200,-50),
##D      xlab="Period (Sec)", ylab="Power (dB)",
##D      main="Corrected PSDs")
##D      
##D for (i in seq(2:nrow(noiseMatrix))) {
##D   points(period, noiseMatrix[i,], type='l')
##D }
## End(Not run)



