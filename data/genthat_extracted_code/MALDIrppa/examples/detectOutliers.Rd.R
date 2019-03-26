library(MALDIrppa)


### Name: detectOutliers
### Title: Detection of outlying mass peak profiles
### Aliases: detectOutliers
### Keywords: ~kwd1 ~kwd2

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

# Find outlying samples at isolate level

## Not run: 
##D out <- detectOutliers(peaks, by = type$isolate)
##D 
##D # From peak presence/absence patterns
##D 
##D out.binary <- detectOutliers(peaks, by = type$isolate, binary = TRUE)
## End(Not run)
  


