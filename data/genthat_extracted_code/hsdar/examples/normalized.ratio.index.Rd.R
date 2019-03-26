library(hsdar)


### Name: nri
### Title: Normalised ratio index
### Aliases: nri
### Keywords: multivariate

### ** Examples

data(spectral_data)

## Calculate NDVI
ndvi <- nri(spectral_data, b1=800, b2=680)

## Calculate all possible combinations for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
nri_WV <- nri(spec_WV, recursive = TRUE)
nri_WV



