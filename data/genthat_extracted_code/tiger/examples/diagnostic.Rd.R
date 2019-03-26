library(tiger)


### Name: diagnostic
### Title: Calculate a number of objectives to compare time series
### Aliases: diagnostic_dawson diagnostic_window diagnostic_series
### Keywords: utilities

### ** Examples

   data(example.peaks,package="tiger")

   plot(reference.peak, type="l")
   lines(example.peaks[1,], lty=2)

   diagnostic_dawson(measured = reference.peak, modelled = example.peaks[1,])

   #first half only
   diagnostic_window(measured=reference.peak, modelled=example.peaks[1,],
			 position = 1, window.size = 45 )
   
   #gliding window for 20 time steps
   diagnostic_series(measured=reference.peak, modelled=example.peaks[1,],
			 window.size = 20 )




