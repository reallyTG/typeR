library(spftir)


### Name: spvalley
### Title: Identification of Valleys of a Mid-infrared Spectra
### Aliases: spvalley

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# List of valley detection
vls <- sppeak(spectra=spectra, span=3, tol=0.2)
# Valleys of the first spectrum
vls[[1]]
# Valleys of the second spectrum
vls[[2]]



