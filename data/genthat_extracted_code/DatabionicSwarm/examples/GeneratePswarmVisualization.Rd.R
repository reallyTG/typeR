library(DatabionicSwarm)


### Name: GeneratePswarmVisualization
### Title: Generates the Umatrix for Pswarm algorithm
### Aliases: GeneratePswarmVisualization
### Keywords: Databonic swarm generalized Umatrix cluster analysis ESOM
###   U-matrix Umatrix sESOM SOM swarm self-organizing-map visualization DR

### ** Examples

data("Lsun3D")
Data=Lsun3D$Data
Cls=Lsun3D$Cls
InputDistances=as.matrix(dist(Data))

## No test: 
res=Pswarm(InputDistances)
resUmatrix=GeneratePswarmVisualization(Data,res$ProjectedPoints,res$LC)
library(GeneralizedUmatrix)
plotTopographicMap(resUmatrix$Umatrix,resUmatrix$Bestmatches,Cls)
## End(No test)

## Don't show: 
data2=matrix(runif(n = 100),10,10)
distance=as.matrix(dist(data2))
res2=Pswarm(distance,LC = c(10,12))
resUmatrix=GeneratePswarmVisualization(matrix(runif(n = 100),10,10),res2$ProjectedPoints,res2$LC)
## End(Don't show)




