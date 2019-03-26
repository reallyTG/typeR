library(spftir)


### Name: sprem
### Title: Remove Alternate Values of a Matrix of Mid-infrared Spectra
### Aliases: sprem

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Removed spectra
rem <- sprem(spectra=spectra, n=1)



