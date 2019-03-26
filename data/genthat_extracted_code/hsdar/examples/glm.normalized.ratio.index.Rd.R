library(hsdar)


### Name: glm.nri
### Title: (Generalised) Linear models from normalised ratio indices
### Aliases: glm.nri lm.nri
### Keywords: multivariate

### ** Examples

data(spectral_data)

## Calculate all possible combinations for WorldView-2-8
spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
                              response_function = FALSE)
nri_WV <- nri(spec_WV, recursive = TRUE)

glmnri <- glm.nri(nri_WV ~ chlorophyll, preddata = spec_WV)
glmnri

plot(glmnri)



