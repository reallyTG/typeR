library(geometry)


### Name: trimesh
### Title: Display triangles mesh (2D)
### Aliases: trimesh
### Keywords: hplot

### ** Examples

#example trimesh
p = cbind(x=rnorm(30), y=rnorm(30))
tt = delaunayn(p)
trimesh(tt,p)



