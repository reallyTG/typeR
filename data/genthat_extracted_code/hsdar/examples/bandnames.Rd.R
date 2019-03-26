library(hsdar)


### Name: bandnames
### Title: Handling names of bands
### Aliases: bandnames bandnames<-
### Keywords: utilities

### ** Examples

data(spectral_data)

## Return band names
bandnames(spectral_data)

## Change band names
bandnames(spectral_data) <- paste("Band", wavelength(spectral_data),
                                  sep = "_")

## Return new band names
bandnames(spectral_data)



