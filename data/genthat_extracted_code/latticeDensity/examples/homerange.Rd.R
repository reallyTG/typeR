library(latticeDensity)


### Name: homerange
### Title: Produces a homerange map.
### Aliases: homerange

### ** Examples

    plot.new()
data(polygon1)
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.015)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
Pointdata <- splancs::csr(polygon1,75)
Pointdata <- Pointdata[Pointdata[,1]<0.5,]
plot(polygon1,type="n")
polygon(polygon1)
points(Pointdata,pch=19)
out <- crossvalDensity(formLatticeOutput,PointPattern=Pointdata,
                      M=0.5,max_steps = 40)
densityOut <- createDensity(formLatticeOutput,PointPattern=Pointdata,
k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)
homerange(densityOut, percent = 0.95)




