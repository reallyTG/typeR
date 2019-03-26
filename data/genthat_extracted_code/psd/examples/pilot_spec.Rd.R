library(psd)


### Name: pilot_spec
### Title: Calculate inital power spectral density estimates
### Aliases: pilot_spec pilot_spec.default pilot_spec.ts pilot_spectrum
###   spec.pilot

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Pilot spectrum
##D ##
##D 
##D data(magnet)
##D 
##D ## simply calculate the pilot spectrum with a few tapers
##D plot(pilot_spec(xc <- magnet$clean), log="dB", 
##D      main="Pilot PSDs for MAGNET and its AR-innovations (red)")
##D 
##D ## remove the effect of an AR model
##D # note: remove.AR -- the max AR model to be removed from the data
##D plot(pilot_spec(xc, remove.AR=10), log="dB", add=TRUE, col="red")
##D 
## End(Not run)#REX



