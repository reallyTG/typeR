library(MALDIrppa)


### Name: writeMetadata
### Title: Write metadata in different formats
### Aliases: writeMetadata
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects
data(type)    # metadata

# Some pre-processing

sc.spectra <- screenSpectra(spectra, meta = type)

spectra <- sc.spectra$fspectra # filtered spectra
type <- sc.spectra$fmeta # filtered metadata

spectra <- transformIntensity(spectra, method = "sqrt")
spectra <- wavSmoothing(spectra)
spectra <- removeBaseline(spectra)
peaks <- detectPeaks(spectra)
peaks <- alignPeaks(peaks, minFreq = 0.8)

# Intensity matrix

int <- intensityMatrix(peaks)

# Save resulting data in R format

writeIntensity(int, filename = "MyintMatrix")
writeMetadata(type, filename = "MyMetadata")

# Save resulting data in csv format

writeIntensity(int, filename = "MyintMatrix", format = "csv")
writeMetadata(type, filename = "MyMetadata", format = "csv")



