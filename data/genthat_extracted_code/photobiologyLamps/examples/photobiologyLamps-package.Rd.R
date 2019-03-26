library(photobiologyLamps)


### Name: photobiologyLamps-package
### Title: photobiologyLamps: Spectral Irradiance Data for Lamps
### Aliases: photobiologyLamps photobiologyLamps-package

### ** Examples

library(photobiologyLamps)
library(photobiologyWavebands)
# extract one spectrum
lamps.mspct$incandescent.60w
lamps.mspct[["incandescent.60w"]]
# using one spectrum in a calculation
q_ratio(lamps.mspct$incandescent.60w, Blue(), Green())
# extracting all the spectra measured with a given instrument
lamps.mspct[bentham_lamps]




