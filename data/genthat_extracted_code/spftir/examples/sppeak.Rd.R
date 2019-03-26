library(spftir)


### Name: sppeak
### Title: Identification of Peaks of a Mid-infrared Spectra
### Aliases: sppeak

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# List of peak detection
pks <- sppeak(spectra=spectra, span=3, tol=0.2)
# Peaks of the first spectrum
pks[[1]]
# Peaks of the second spectrum
pks[[2]]



