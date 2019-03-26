library(latticeDensity)


### Name: addObservations
### Title: Input observations for use in the lattice-based density
###   estimator
### Aliases: addObservations

### ** Examples

plot.new()
data(polygon1)
#
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.01)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
#
Pointdata <- splancs::csr(polygon1,30)
Pointdata <- Pointdata[Pointdata[,1]<0.5,]
colnames(Pointdata) <- c("x","y")
plot(polygon1,type="n")
polygon(polygon1)
points(Pointdata,pch=19)
#
densityOut <- createDensity(formLatticeOutput,PointPattern=Pointdata,
                           k=40,intensity=FALSE, sparse = TRUE)
plot(densityOut)



