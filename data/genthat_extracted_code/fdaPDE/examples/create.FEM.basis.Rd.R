library(fdaPDE)


### Name: create.FEM.basis
### Title: Create a FEM basis
### Aliases: create.FEM.basis

### ** Examples

## Creates a simple triangulated domain with a concavity; this is a MESH2D object  
mesh<-create.MESH.2D(nodes=rbind(c(0, 0), c(0, 1), c(0.5, 0.5), c(1, 1), c(1, 0)),
segments=rbind(c(1, 2), c(2, 3), c(3, 4), c(4, 5), c(5, 1)), order=1)
## Plot it
plot(mesh)                   
## Creates the basis
FEMbasis = create.FEM.basis(mesh)



