library(fractal)


### Name: HDEst
### Title: Hurvich-Deo estimate of number of frequencies to use in a
###   periodogram regression
### Aliases: HDEst
### Keywords: univar models nonlinear

### ** Examples

S <- sapa::SDF(beamchaos)
HDEst(NFT=length(S),as.vector(S))



