library(fitTetra)


### Name: CodomMarker
### Title: Function to fit a mixture model to a vector of signal ratios of
###   a single bi-allelic marker
### Aliases: CodomMarker
### Keywords: utilities

### ** Examples

data(tetra.potato.SNP)
SNP6 <- subset(tetra.potato.SNP, MarkerName=='PotSNP006')
# Single marker, single mixture model
rawratio <- SNP6$X_Raw/(SNP6$X_Raw+SNP6$Y_Raw) 
unmix <- CodomMarker(rawratio)



