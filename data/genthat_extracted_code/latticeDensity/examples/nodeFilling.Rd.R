library(latticeDensity)


### Name: nodeFilling
### Title: Produces a grid of locations inside the region boundary.
### Aliases: nodeFilling

### ** Examples

plot.new()
data(polygon1)
nodeFillingOutput <- nodeFilling(poly=polygon1,node_spacing=0.02)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)




