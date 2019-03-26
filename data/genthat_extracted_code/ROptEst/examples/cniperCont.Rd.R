library(ROptEst)


### Name: cniperCont
### Title: Functions for Computation and Plot of Cniper Contamination and
###   Cniper Points.
### Aliases: cniperCont cniperPoint cniperPointPlot
### Keywords: robust

### ** Examples

## cniper contamination
P <- PoisFamily(lambda = 4)
RobP1 <- InfRobModel(center = P, neighbor = ContNeighborhood(radius = 0.1))
IC1 <- optIC(model=RobP1, risk=asMSE())
RobP2 <- InfRobModel(center = P, neighbor = ContNeighborhood(radius = 1))
IC2 <- optIC(model=RobP2, risk=asMSE())
cniperCont(IC1 = IC1, IC2 = IC2,
           neighbor = ContNeighborhood(radius = 0.5), 
           risk = asMSE(),
           lower = 0, upper = 8, n = 101)

## cniper point plot
cniperPointPlot(P, neighbor = ContNeighborhood(radius = 0.5), 
                risk = asMSE(), lower = 0, upper = 10)

## Don't run to reduce check time on CRAN
## No test: 
## cniper point
cniperPoint(P, neighbor = ContNeighborhood(radius = 0.5), 
            risk = asMSE(), lower = 0, upper = 4)
cniperPoint(P, neighbor = ContNeighborhood(radius = 0.5), 
            risk = asMSE(), lower = 4, upper = 8)
## End(No test)



