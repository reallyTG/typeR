library(spftir)


### Name: spnorm01
### Title: Normalizes the Absorbance Between 0 and 1 of a Matrix of
###   Mid-infrared Spectra
### Aliases: spnorm01

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Normalized spectra between 0 and 1
norm <- spnorm01(spectra=spectra)



