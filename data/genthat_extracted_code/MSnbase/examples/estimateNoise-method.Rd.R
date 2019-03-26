library(MSnbase)


### Name: estimateNoise-methods
### Title: Noise Estimation for 'Spectrum' instances
### Aliases: estimateNoise-methods estimateNoise
### Keywords: methods

### ** Examples

sp1 <- new("Spectrum1",
           intensity = c(1:6, 5:1),
           mz = 1:11,
           centroided = FALSE)
estimateNoise(sp1, method = "SuperSmoother")



