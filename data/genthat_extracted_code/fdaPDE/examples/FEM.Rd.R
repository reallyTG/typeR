library(fdaPDE)


### Name: FEM
### Title: Define a surface or spatial field by a Finite Element basis
###   expansion
### Aliases: FEM

### ** Examples

## Upload a triangular mesh and plot it
data("mesh.2D.rectangular")
plot(mesh.2D.rectangular)
## Create a linear Finite Element basis
FEMbasis = create.FEM.basis(mesh.2D.rectangular)
## Define a sinusoidal function as expansion of this basis and plot it
coeff <- sin(mesh.2D.rectangular$nodes[,1])*cos(mesh.2D.rectangular$nodes[,2])
FEM_object<- FEM(coeff, FEMbasis)
plot(FEM_object)



