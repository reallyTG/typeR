library(DatabionicSwarm)


### Name: setGridSize
### Title: Sets the grid size for the Pswarm algorithm
### Aliases: setGridSize
### Keywords: ~kwd1 ~kwd2

### ** Examples

data("Lsun3D")
Data=Lsun3D$Data
Cls=Lsun3D$Cls
InputDistances=as.matrix(dist(Data))
#If not called separately setGridSize() is called in Pswarm
LC=setGridSize(InputDistances)



