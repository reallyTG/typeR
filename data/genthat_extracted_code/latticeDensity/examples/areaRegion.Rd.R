library(latticeDensity)


### Name: areaRegion
### Title: Computes area of a region
### Aliases: areaRegion

### ** Examples

data(areaRegionExample)
attach(areaRegionExample)
hole_list <- list(hole1,hole2)
nodeFillingOutput <- nodeFilling(poly=boundary, node_spacing=0.03,
                               hole_list = hole_list)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
areaRegion(formLatticeOutput)



