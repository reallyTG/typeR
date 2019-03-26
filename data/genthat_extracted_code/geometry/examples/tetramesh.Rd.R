library(geometry)


### Name: tetramesh
### Title: Render tetrahedron mesh (3D)
### Aliases: tetramesh
### Keywords: hplot

### ** Examples

## Not run: 
##D # example delaunayn
##D d = c(-1,1)
##D pc = as.matrix(rbind(expand.grid(d,d,d),0))
##D tc = delaunayn(pc)
##D 
##D # example tetramesh
##D clr = rep(1,3) %o% (1:nrow(tc)+1)
##D rgl::rgl.viewpoint(60,fov=20)
##D rgl::rgl.light(270,60)
##D tetramesh(tc,pc,alpha=0.7,col=clr)
## End(Not run)



