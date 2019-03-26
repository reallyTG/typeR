library(IRISMustangMetrics)


### Name: spectrumMetric2Xml
### Title: Convert a SpectrumMetric into XML for the BSS
### Aliases: spectrumMetric2Xml

### ** Examples

  ## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D # NOTE:  The following trace has 1.728 million points.
##D # NOTE:  Downloading and calculating PSD may take a while.
##D starttime <- as.POSIXct("2010-02-27",tz="GMT")
##D endtime <- as.POSIXct("2010-02-28",tz="GMT")
##D   
##D # Get the waveform
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D 
##D # Make sure we're working with a single snclq
##D unique_ids <- uniqueIds(st)
##D if (length(unique_ids) > 1) {
##D   stop(paste("PSDMetric: Stream has",unique_ids,"unique identifiers"))
##D }
##D snclq <- unique_ids[1]
##D 
##D # Calculate and plot the Power Spectral Density
##D psdList <- psdList(st)
##D   
##D # Create a Spectrum metric list
##D spectrumMetricList <- list()
##D index <- 1
##D for (psd in psdList) {
##D   spectrumMetricList[[index]] <- new("SpectrumMetric", snclq=snclq,  
##D                                       starttime=psd$starttime, endtime=psd$endtime, 
##D                                       metricName="psd", freqs=psd$freq,
##D                                       amps=psd$spec, phases=psd$freq*0)
##D   index <- index + 1
##D }
##D 
##D # Show the XML version of the metric
##D bssXml <- spectrumMetric2Xml(spectrumMetricList)
##D cat(bssXml)
##D   
## End(Not run)



