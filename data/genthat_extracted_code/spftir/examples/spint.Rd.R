library(spftir)


### Name: spint
### Title: Interpolation for Intermediate Values of a Matrix of
###   Mid-infrared Spectra
### Aliases: spint

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Interpolated spectra
int <- spint(spectra=spectra, n=1)



