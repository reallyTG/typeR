library(ROptEstOld)


### Name: GammaFamily
### Title: Generating function for Gamma families
### Aliases: GammaFamily
### Keywords: models

### ** Examples

distrExOptions("EupperTruncQuantile" = 1e-15) # problem with q(Gamma())(1) = NaN
(G1 <- GammaFamily())
FisherInfo(G1)
checkL2deriv(G1)
distrExOptions("EupperTruncQuantile" = 0) # default



