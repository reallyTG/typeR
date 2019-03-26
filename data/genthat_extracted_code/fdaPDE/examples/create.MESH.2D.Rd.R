library(fdaPDE)


### Name: create.MESH.2D
### Title: Create a triangular mesh
### Aliases: create.MESH.2D

### ** Examples

## Upload the Meuse data
data(MeuseData)
## Create a triangulation on the convex hull of these data,
## where each data location is a triangle vertex
mesh <- create.MESH.2D(nodes = MeuseData[,c(2,3)], order = 1)
## Plot the mesh
plot(mesh)
## Upload a domain boundary for these data
data(MeuseBorder)
## Create a constrained Delaunay triangulation with the provided boundary 
## where each datalocation is a triangle vertex
mesh <- create.MESH.2D(nodes = MeuseData[,c(2,3)], segments = MeuseBorder, order = 1)
## Plot the mesh
plot(mesh)



