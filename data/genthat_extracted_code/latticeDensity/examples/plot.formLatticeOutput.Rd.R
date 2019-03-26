library(latticeDensity)


### Name: plot.formLatticeOutput
### Title: Plot the lattice.
### Aliases: plot.formLatticeOutput

### ** Examples

plot.new()
data(polygon1)
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.015)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)




