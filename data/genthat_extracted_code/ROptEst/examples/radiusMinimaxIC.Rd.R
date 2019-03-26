library(ROptEst)


### Name: radiusMinimaxIC
### Title: Generic function for the computation of the radius minimax IC
### Aliases: radiusMinimaxIC radiusMinimaxIC-methods
###   radiusMinimaxIC,L2ParamFamily,UncondNeighborhood,asGRisk-method
### Keywords: robust

### ** Examples

N <- NormLocationFamily(mean=0, sd=1) 
radIC <- radiusMinimaxIC(L2Fam=N, neighbor=ContNeighborhood(), 
                         risk=asMSE(), loRad=0.1, upRad=0.5)
checkIC(radIC)



