library(photobiologyLEDs)


### Name: photobiologyLEDs-package
### Title: photobiologyLEDs: Spectral Data for Light-Emitting-Diodes
### Aliases: photobiologyLEDs photobiologyLEDs-package

### ** Examples

library(photobiology)
library(photobiologyWavebands)
library(ggspectra)

names(leds.mspct)

q_ratio(leds.mspct$white, Blue(), Red())

peaks(leds.mspct$white, span = 101)

plot(leds.mspct$white)

q_ratio(leds.mspct$Q36_4000K, Blue(), Red())

## Not run: 
##D plot(leds.mspct$Q36_4000K)
## End(Not run)

q_ratio(leds.mspct$NS6L183AT_H1, Blue(), Red())

## Not run: 
##D plot(leds.mspct$NS6L183AT_H1)
## End(Not run)

## Not run: 
##D plot(leds.mspct$NS6L183AT_H1, unit.out = "photon")
## End(Not run)

## Not run: 
##D plot(leds.mspct$NS6L183AT_H1, 
##D      range = VIS(), 
##D      w.band = VIS_bands(),
##D      span = 101)
## End(Not run)




