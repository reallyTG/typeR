library(MALDIrppa)


### Name: countPeaks
### Title: Count the number of peaks in 'MassPeaks' objects
### Aliases: countPeaks
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

# Count peaks

npeaks <- countPeaks(peaks)



