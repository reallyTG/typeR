library(spftir)


### Name: sptrun
### Title: Truncation of a Region of a Mid-Infrared Spectral Matrix
### Aliases: sptrun

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# Truncated
trn <- sptrun(spectra=spectra, limInf=800, limSup=2000)



