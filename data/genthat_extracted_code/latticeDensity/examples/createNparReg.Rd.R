library(latticeDensity)


### Name: createNparReg
### Title: Performs nonparametric regression on irregular regions.
### Aliases: createNparReg

### ** Examples

data(nparExample)
attach(nparExample)
plot.new()
#  Simulate a response variable
index1 = (grid2[,2]<0.8)|(grid2[,1]>0.6)
Z = rep(NA,length(grid2[,1]))
n1 = sum(index1)
n2 = sum(!index1)
Z[index1] <- 3*grid2[index1,1] + 4 + rnorm(n1,0,sd=0.4)
Z[!index1] <- -2*grid2[!index1,1] + 4 + rnorm(n2,0,sd=0.4)
#
coords=rbind(polygon2,polygon2[1,])
plot(coords,type="l")
points(grid2,pch=19,cex=0.5,xlim=c(-0.1,1))
text(grid2,labels=round(Z,1),pos=4,cex=0.5)
#
nodeFillingOutput <- nodeFilling(poly=polygon2, node_spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
NparRegOut <- createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=2)
plot(NparRegOut)




