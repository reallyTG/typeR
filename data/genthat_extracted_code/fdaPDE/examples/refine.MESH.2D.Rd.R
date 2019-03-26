library(fdaPDE)


### Name: refine.MESH.2D
### Title: Refine a triangular mesh
### Aliases: refine.MESH.2D

### ** Examples

## Upload the Meuse data and a domain boundary for these data
data(MeuseData)
data(MeuseBorder)
## Create a Constrained Delaunay triangulation
mesh <- create.MESH.2D(nodes = MeuseData[,c(2,3)], segments = MeuseBorder, order = 1)
## Plot the mesh
plot(mesh)
## Refine the triangulation
mesh_refine <- refine.MESH.2D(mesh, minimum_angle = 30, maximum_area = 10000)
plot(mesh_refine)



