library(ROptEst)


### Name: comparePlot-methods
### Title: Compare - Plots
### Aliases: comparePlot comparePlot-methods comparePlot,IC,IC-method
### Keywords: robust

### ** Examples

N0 <- NormLocationScaleFamily(mean=0, sd=1)
N0.Rob1 <- InfRobModel(center = N0,
           neighbor = ContNeighborhood(radius = 0.5))

## Don't run to reduce check time on CRAN
## Not run: 
##D IC1 <- optIC(model = N0, risk = asCov())
##D IC2 <- optIC(model = N0.Rob1, risk = asMSE())
##D 
##D comparePlot(IC1,IC2, withMBR=TRUE)
## End(Not run)



