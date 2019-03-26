library(MALDIrppa)


### Name: alignPeaks
### Title: Compact peak alignment process for 'MassPeaks' objects
### Aliases: alignPeaks
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects

# Some pre-processing

spectra <- screenSpectra(spectra)$fspectra
spectra <- transformIntensity(spectra, method = "sqrt")
spectra <- wavSmoothing(spectra)
spectra <- removeBaseline(spectra)
peaks <- detectPeaks(spectra)

# Peak alignment

peaks <- alignPeaks(peaks, minFreq = 0.8)




