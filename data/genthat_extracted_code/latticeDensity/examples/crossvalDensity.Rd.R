library(latticeDensity)


### Name: crossvalDensity
### Title: UBC crossvalidation for the lattice-based density estimator.
### Aliases: crossvalDensity

### ** Examples

plot.new()
data(polygon1)
#
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.02)
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
out <- crossvalDensity(formLatticeOutput,PointPattern=Pointdata, 
       M=0.5,max_steps = 70)
#
densityOut <- createDensity(formLatticeOutput,PointPattern=Pointdata, 
                          k=out$k,intensity=FALSE, sparse = TRUE)
plot(densityOut)
#
homerange(densityOut, percent = 0.95) 



