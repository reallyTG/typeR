library(MALDIrppa)


### Name: wavSmoothing
### Title: Discrete wavelet transformation for 'MassSpectrum' objects
### Aliases: wavSmoothing
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects

# sqrt transformation and signal smoothing using UDWT

spectra <- transformIntensity(spectra, method = "sqrt")
spectra <- wavSmoothing(spectra)



