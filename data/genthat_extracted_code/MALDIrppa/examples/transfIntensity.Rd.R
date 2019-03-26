library(MALDIrppa)


### Name: transfIntensity
### Title: Transform intensity of 'MassSpectrum' objects
### Aliases: transfIntensity

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects

# Scale intensities into [0, 1] by dividing by their maximum value

scale.max <- function(x){x/max(x)} # define scaling function

scaled.spectra <- transfIntensity(spectra, fun = scale.max)
    
# Compute natural logarithm of intensity values (using the pre-defined sqrt R function)

log.spectra <- transfIntensity(spectra, sqrt)





