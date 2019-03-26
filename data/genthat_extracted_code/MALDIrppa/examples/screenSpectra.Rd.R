library(MALDIrppa)


### Name: screenSpectra
### Title: Identification of potentially low-quality raw mass spectra
### Aliases: screenSpectra
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Load example data

data(spectra) # list of MassSpectra objects
data(type)    # metadata

# Results using different settings

sc.results <- screenSpectra(spectra)
sc.results <- screenSpectra(spectra, type)
sc.results <- screenSpectra(spectra, type, method = "RC")
sc.results <- screenSpectra(spectra, type, threshold = 3, estimator = "MAD", method = "Hampel")

# Numerical and graphical summary

summary(sc.results)
plot(sc.results)

# Save filtered data for further pre-processing

filtered.spectra <- sc.results$fspectra
filtered.type <- sc.results$fmeta



