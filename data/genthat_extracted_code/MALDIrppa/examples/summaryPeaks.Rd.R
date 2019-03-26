library(MALDIrppa)


### Name: summaryPeaks
### Title: Summary of mass peak profiles
### Aliases: summaryPeaks
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects
data(type)    # metadata

# Some pre-processing

sc.results <- screenSpectra(spectra, meta = type)

spectra <- sc.results$fspectra
type <- sc.results$fmeta

spectra <- transformIntensity(spectra, method = "sqrt")
spectra <- wavSmoothing(spectra)
spectra <- removeBaseline(spectra)
peaks <- detectPeaks(spectra)

names(peaks) <- type$SpectID # spectra IDs are lost after removeBaseline()

# Summary of peak profile features (results for positions 10 to 20)

summaryPeaks(peaks[10:20])




