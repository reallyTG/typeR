library(ROptEst)


### Name: getRadius
### Title: Computation of the Optimal Radius for Given Clipping Bound
### Aliases: getRadius
### Keywords: robust

### ** Examples

N <- NormLocationFamily(mean=0, sd=1)
nb <- ContNeighborhood(); ri <- asMSE()
radIC <- radiusMinimaxIC(L2Fam=N, neighbor=nb, risk=ri, loRad=0.1, upRad=0.5)
getRadius(radIC, L2Fam=N, neighbor=nb, risk=ri)

## taken from script NormalScaleModel.R in folder scripts
N0 <- NormScaleFamily(mean=0, sd=1)
(N0.IC7 <- radiusMinimaxIC(L2Fam=N0, neighbor=nb, risk=ri, loRad=0, upRad=Inf))
##
getRadius(N0.IC7, risk=asMSE(), neighbor=nb, L2Fam=N0)
getRadius(N0.IC7, risk=asL4(), neighbor=nb, L2Fam=N0)



