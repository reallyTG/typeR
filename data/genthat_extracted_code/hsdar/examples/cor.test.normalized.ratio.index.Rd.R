library(hsdar)


### Name: cor.test
### Title: Test for association/correlation between nri values and vector
###   of samples
### Aliases: cor.test.nri cor.test,Nri-method

### ** Examples

data(spectral_data)

## Calculate all possible combinations for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
nri_WV <- nri(spec_WV, recursive = TRUE)

cortestnri <- cor.test(nri_WV, SI(spec_WV)$chlorophyll)

cortestnri



