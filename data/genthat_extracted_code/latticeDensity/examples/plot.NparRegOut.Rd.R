library(latticeDensity)


### Name: plot.NparRegOut
### Title: Plot the non-parametric regression surface.
### Aliases: plot.NparRegOut

### ** Examples

data(nparExample)
attach(nparExample)
plot.new()
#  Simulate a response variable
index1 <- (grid2[,2]<0.8)|(grid2[,1]>0.6)
Z <- rep(NA,length(grid2[,1]))
n1 <- sum(index1)
n2 <- sum(!index1)
Z[index1] <- 3*grid2[index1,1] + 4 + rnorm(n1,0,sd=0.4)
Z[!index1] <- -2*grid2[!index1,1] + 4 + rnorm(n2,0,sd=0.4)
#
plot(polygon2,type="n")
polygon(polygon2)
points(grid2,pch=19,cex=0.5,xlim=c(-0.1,1))
text(grid2,labels=round(Z,1),pos=4,cex=0.5)
#  Following is the generation of the nonparametric
#  regression prediction surface.
nodeFillingOutput <- nodeFilling(poly=polygon2, node_spacing=0.025)
plot(nodeFillingOutput)
formLatticeOutput <- formLattice(nodeFillingOutput)
plot(formLatticeOutput)
NparRegOut <- createNparReg(formLatticeOutput,Z,PointPattern=grid2,k=2)
plot(NparRegOut)



