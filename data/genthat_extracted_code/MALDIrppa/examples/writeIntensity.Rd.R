library(MALDIrppa)


### Name: writeIntensity
### Title: Write intensity matrix in different formats
### Aliases: writeIntensity
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
peaks <- alignPeaks(peaks, minFreq = 0.8)

# Intensity matrix

int <- intensityMatrix(peaks)

# default R format

writeIntensity(int,file="int")

# binary NEXUS file

writeIntensity(int,file="int.binary",format="NEXUS",interleaved=FALSE)



