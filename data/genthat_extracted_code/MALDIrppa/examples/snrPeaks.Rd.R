library(MALDIrppa)


### Name: snrPeaks
### Title: Extract signal-to-noise ratio thresholds from 'MassPeaks'
###   objects
### Aliases: snrPeaks
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

# Extract thresholds for each mass peak profile

SNRs <- snrPeaks(peaks)



