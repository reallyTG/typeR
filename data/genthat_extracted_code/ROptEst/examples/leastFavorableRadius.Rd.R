library(ROptEst)


### Name: leastFavorableRadius
### Title: Generic Function for the Computation of Least Favorable Radii
### Aliases: leastFavorableRadius leastFavorableRadius-methods
###   leastFavorableRadius,L2ParamFamily,UncondNeighborhood,asGRisk-method
### Keywords: robust

### ** Examples

N <- NormLocationFamily(mean=0, sd=1) 
leastFavorableRadius(L2Fam=N, neighbor=ContNeighborhood(),
                     risk=asMSE(), rho=0.5)



