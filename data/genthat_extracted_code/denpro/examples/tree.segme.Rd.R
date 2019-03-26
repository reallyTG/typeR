library(denpro)


### Name: tree.segme
### Title: Returns the segmentation of the nodes of a visualization tree
### Aliases: tree.segme
### Keywords: cluster

### ** Examples

dendat<-sim.data(n=1000,type="cross",seed=1)
rho<-1.1
tt<-leafsfirst(dendat=dendat,rho=rho)

ts<-tree.segme(tt)

plot(dendat,col=ts)

paracoor(dendat,paletti=ts)




