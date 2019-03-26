library(LSMonteCarlo)


### Name: QuantoAmerPutLSMPriceSurf
### Title: Deriving a table of Quanto American put prices at different
###   volatilities and strikes
### Aliases: QuantoAmerPutLSMPriceSurf
### Keywords: Monte Carlo Option pricing American put

### ** Examples

surface<-QuantoAmerPutLSMPriceSurf(vols = (seq(0.1, 1.7, 0.2)), n=100, m=5, 
strikes = (seq(0.7, 1.7, 0.2)))
summary(surface)
plot(surface, color = divPalette(150, "RdBu"))



