library(fdaPDE)


### Name: plot.MESH2D
### Title: Plot a MESH2D object
### Aliases: plot.MESH2D

### ** Examples

## Upload the Meuse data and a domain boundary
data(MeuseData)
data(MeuseBorder)
## Create a triangular mesh with the provided boundary
mesh <- create.MESH.2D(nodes = MeuseData[,c(2,3)], segments = MeuseBorder, order = 1)
## Plot it
plot(mesh)



