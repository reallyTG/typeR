library(IRISSeismic)


### Name: psdPlot
### Title: Generate plots from a set of PSDs
### Aliases: psdPlot
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
##D # 'psd' line plot
##D psdPlot(psdList,style='psd',type='l',col=adjustcolor('black',0.3))
##D 
##D # McNamara 'pdf' plot
##D psdPlot(psdList,style='pdf')
## End(Not run)



