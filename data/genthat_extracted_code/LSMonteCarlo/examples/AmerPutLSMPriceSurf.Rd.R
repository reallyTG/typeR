library(LSMonteCarlo)


### Name: AmerPutLSMPriceSurf
### Title: Deriving a table of American put prices at different
###   volatilities and strikes
### Aliases: AmerPutLSMPriceSurf summary.PriceSurface plot.PriceSurface
### Keywords: Monte Carlo Option pricing American put

### ** Examples

surface<-AmerPutLSMPriceSurf(vols = (seq(0.1, 1.5, 0.2)), n=200, m=10, 
strikes = (seq(0.5, 1.9, 0.2)))
summary(surface)
plot(surface, color = divPalette(150, "RdBu"))



