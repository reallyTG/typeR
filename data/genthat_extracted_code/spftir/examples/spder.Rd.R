library(spftir)


### Name: spder
### Title: N-derived of a Mid-infrared Spectra
### Aliases: spder

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Derivative spectra
der <- spder(spectra=spectra, order=2, p=3, sw= 11)



