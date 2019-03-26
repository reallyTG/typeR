library(MALDIrppa)


### Name: addMetadata
### Title: Add metadata to 'AbstractMassObject' class objects
### Aliases: addMetadata

### ** Examples

# Load example data

data(spectra) # list of MassSpectra class objects
data(type)    # metadata

# Add metadata

info <- paste("Spectrum No.",1:length(spectra)) # Artificial metadata vector

spectra2 <- addMetadata(spectra,info,1)

# Check info in metaData slot

spectra2[[1]]@metaData





