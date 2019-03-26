library(latticeDensity)


### Name: formLattice
### Title: Builds a neighbor structure on the nodes.
### Aliases: formLattice

### ** Examples

plot.new()
data(polygon1)
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.02)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
Pointdata <- splancs::csr(polygon1,80)
Pointdata <- Pointdata[Pointdata[,1]<0.5,]
plot(polygon1,type="n")
polygon(polygon1)
points(Pointdata,pch=19)
densityOut <- createDensity(formLatticeOutput,PointPattern=Pointdata,
                           k=20,intensity=FALSE, sparse = TRUE)
plot(densityOut)
homerange(densityOut, percent = 0.95)





