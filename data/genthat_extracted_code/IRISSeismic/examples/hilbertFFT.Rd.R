library(IRISSeismic)


### Name: hilbertFFT
### Title: Hilbert FFT
### Aliases: hilbertFFT
### Keywords: methods

### ** Examples

## Not run: 
##D # Open a connection to IRIS DMC webservices
##D iris <- new("IrisClient")
##D 
##D starttime <- as.POSIXct("2010-02-27 06:00:00", tz="GMT")
##D endtime <- as.POSIXct("2010-02-27 09:00:00", tz="GMT")
##D 
##D # Get the waveform
##D st <- getDataselect(iris,"IU","ANMO","00","BHZ",starttime,endtime)
##D tr <- st@traces[[1]]
##D 
##D # Demean, detrend, cosine taper
##D tr <- DDT(tr)
##D 
##D # Calculate Hilbert FFT of the trace data
##D hfft <- hilbertFFT(tr@data)
##D 
##D # Plot signal, with Hilbert envelope
##D layout(1)
##D plot(tr@data, type='l', col='gray80', main="Signal and Envelope")
##D points(Mod(hfft), type='l', col='blue')
##D 
##D # 2 rows
##D layout(matrix(seq(2)))
##D 
##D # Show that Imaginary component of Hilbert transform has the
##D # original signal shifted by 90 degrees
##D ccf(tr@data,tr@data,lag.max=200,main="Auto-correlation of signal data")
##D ccf(tr@data,Im(hfft),lag.max=200,main="90 deg phase shift with Hilber transform")
##D 
##D # Restore default layout
##D layout(1)
## End(Not run)



