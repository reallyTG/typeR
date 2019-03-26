library(geometry)


### Name: delaunayn
### Title: Delaunay triangulation in N-dimensions
### Aliases: delaunayn
### Keywords: dplot graphs math

### ** Examples

# example delaunayn
d <- c(-1,1)
pc <- as.matrix(rbind(expand.grid(d,d,d),0))
tc <- delaunayn(pc)

# example tetramesh
## Not run: 
##D rgl::rgl.viewpoint(60)
##D rgl::rgl.light(120,60)
##D tetramesh(tc,pc, alpha=0.9)
## End(Not run)



