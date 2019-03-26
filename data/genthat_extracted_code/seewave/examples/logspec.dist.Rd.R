library(seewave)


### Name: logspec.dist
### Title: Log-spectral distance
### Aliases: logspec.dist
### Keywords: distribution ts

### ** Examples

# Comparison of two spectra
data(tico)
tico1 <- spec(tico, at=0.65, plot=FALSE)
tico2 <- spec(tico, at=1.1, plot=FALSE)
logspec.dist(tico1, tico2)
logspec.dist(tico1, tico2, scale=TRUE)



