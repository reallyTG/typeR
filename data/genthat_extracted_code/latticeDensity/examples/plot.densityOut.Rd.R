library(latticeDensity)


### Name: plot.densityOut
### Title: Plot the density map
### Aliases: plot.densityOut

### ** Examples

plot.new()
data(polygon1)
#
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
#
Pointdata <- splancs::csr(polygon1,75)
Pointdata <- Pointdata[Pointdata[,1]<0.5,]
plot(polygon1,type="n")
polygon(polygon1)
points(Pointdata,pch=19)
#
densityOut <- createDensity(formLatticeOutput,PointPattern=Pointdata,
                           k=55,intensity=FALSE, sparse = TRUE)
plot(densityOut)
#
homerange(densityOut, percent = 0.95)




