library(DatabionicSwarm)


### Name: Pswarm
### Title: A Swarm of Databots based on polar coordinates (Polar Swarm).
### Aliases: pswarmCpp Pswarm pswarm
### Keywords: DBS swarm swarms Databonic swarm Databionic Swarm pswarm
###   pSwarm PSwarm swarm intelligence cluster analysis projection
###   projection method dimensionality reduction visualization DR

### ** Examples

data("Lsun3D")
Data=Lsun3D$Data
Cls=Lsun3D$Cls
InputDistances=as.matrix(dist(Data))
#If not called separately setGridSize() is called in Pswarm
LC=setGridSize(InputDistances)
## No test: 
res=Pswarm(InputDistances,LC=LC,Cls=Cls,PlotIt=TRUE)
## End(No test)

## Don't show: 
data=matrix(runif(n = 100),10,10)
distance=as.matrix(dist(data))
res=Pswarm(distance,LC = c(10,12))
## End(Don't show)



