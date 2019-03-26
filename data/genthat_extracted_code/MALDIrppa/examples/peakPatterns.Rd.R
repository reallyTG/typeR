library(MALDIrppa)


### Name: peakPatterns
### Title: Display peak presence/absence patterns
### Aliases: peakPatterns

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects
data(type) # metadata

# Some pre-processing

sc.results <- screenSpectra(spectra,meta=type)
spectra <- sc.results$fspectra # filtered mass spectra
type <- sc.results$fmeta    # filtered metadata  
spectra <- transformIntensity(spectra, method = "sqrt")
spectra <- wavSmoothing(spectra)
spectra <- removeBaseline(spectra)
peaks <- detectPeaks(spectra)
peaks <- alignPeaks(peaks, minFreq = 0.8)

# Display patterns across all data

peakPatterns(peaks)

# Check results within isolate 280

peakPatterns(peaks[type$Isolate=="280"])




