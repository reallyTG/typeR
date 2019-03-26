library(MALDIrppa)


### Name: summarySpectra
### Title: Summary of mass spectra
### Aliases: summarySpectra
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects
data(type)    # metadata

# Summary of spectra features (results for 20 first mass spectra)

summarySpectra(spectra[1:20])

# Some pre-processing

sc.results <- screenSpectra(spectra, meta = type)

spectra <- sc.results$fspectra
type <- sc.results$fmeta

spectra <- transformIntensity(spectra, method = "sqrt")
spectra <- wavSmoothing(spectra)
spectra <- removeBaseline(spectra)

names(spectra) <- type$SpectID # spectra IDs are lost with removeBaseline()

# Summary of spectra features (results for positions 10 to 20)

summarySpectra(spectra[10:20])



