library(latticeDensity)


### Name: Tkp
### Title: Compute the vector T^k*p
### Aliases: Tkp

### ** Examples

plot.new()
data(polygon1)
nodeFillingOutput <- nodeFilling(poly=polygon1, node_spacing=0.015)
formLatticeOutput <- formLattice(nodeFillingOutput)
Pointdata <- splancs::csr(polygon1,75)
Pointdata <- Pointdata[Pointdata[,1]<0.5, ]
init_prob <- addObservations(formLatticeOutput, Pointdata)
T <- makeTmatrix(formLatticeOutput, M = 0.5, sparse=TRUE)
p10 <- Tkp(T, k=10, p=init_prob$init_prob)
head(cbind(init_prob$init_prob, p10))




