library(spftir)


### Name: spsgb
### Title: Savitzky-Golay Smoothing Filter of a Mid-infrared Spectra
### Aliases: spsgb

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Smoothed spectra
sgb <- spsgb(spectra=spectra, p=2, sw= 21)



