library(spftir)


### Name: spoffs
### Title: Offset Correction of a Matrix of Mid-infrared Spectra
### Aliases: spoffs

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Offset correction
offs <- spoffs(spectra=spectra)



