library(spftir)


### Name: spnormw
### Title: Normalizes the Absorbance of a Matrix of Mid-infrared Spectra by
###   a Specific Band
### Aliases: spnormw

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Normalized spectra by a specific band
normw <- spnormw(spectra=spectra, wn=1510)



