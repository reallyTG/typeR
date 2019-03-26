library(fdaPDE)


### Name: image.FEM
### Title: Image Plot of a FEM object
### Aliases: image.FEM

### ** Examples

## Upload a triangular mesh and plot it
data("mesh.2D.rectangular")
plot(mesh.2D.rectangular)
## Create a linear Finite Element basis
FEMbasis = create.FEM.basis(mesh.2D.rectangular)
## Define a sinusoidal function as expansion of this basis and plot it
coeff <- sin(mesh.2D.rectangular$nodes[,1])*cos(mesh.2D.rectangular$nodes[,2])
FEM_object<- FEM(coeff, FEMbasis)
image(FEM_object)



