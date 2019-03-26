library(inlabru)


### Name: vertices.inla.mesh
### Title: Extract vertex locations from an 'inla.mesh'
### Aliases: vertices.inla.mesh

### ** Examples

## No test: 
data("mrsea")
vrt = vertices(mrsea$mesh)
ggplot() + gg(mrsea$mesh) + gg(vrt, color = "red")
## End(No test)



