library(excursions)


### Name: submesh.mesh
### Title: Extract a part of a mesh
### Aliases: submesh.mesh

### ** Examples

## Not run: 
##D if (require(INLA)) {
##D nxy = 30
##D x=seq(from=0,to=4,length.out=nxy)
##D lattice=inla.mesh.lattice(x=x,y=x)
##D mesh=inla.mesh.create(lattice=lattice, extend=FALSE, refine=FALSE)
##D 
##D #extract a part of the mesh inside a circle
##D xy.in <- rowSums((mesh$loc[,1:2]-2)^2)<1
##D submesh <- excursions:::submesh.mesh(matrix(xy.in,nxy,nxy),mesh)
##D plot(mesh$loc[,1:2])
##D lines(2+cos(seq(0,2*pi,length.out=100)), 2+sin(seq(0,2*pi,length.out=100)))
##D plot(submesh,add=TRUE)
##D points(mesh$loc[xy.in,1:2],col="2")
##D }
## End(Not run)



