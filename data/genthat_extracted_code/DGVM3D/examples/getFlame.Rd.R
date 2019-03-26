library(DGVM3D)


### Name: getFlame
### Title: Get the shape of a single flame
### Aliases: getFlame

### ** Examples

## Not run: 
##D center = getFlame(dz=0.8)
##D triangles3d(center$vertices[center$id[, (2 * 20 + 1):150], ],
##D             col="#e6ffff", alpha=1, shininess=1,lit=FALSE)
##D inner = getFlame(dz=0.97, expand=2)
##D triangles3d(inner$vertices[inner$id[, (2 * 20 + 1):175], ],
##D             col="#f0ff00", alpha=0.6, shininess=1,lit=FALSE)
##D outer = getFlame(dz=1, expand=3)
##D triangles3d(outer$vertices[outer$id[, (2*20+1):200], ],
##D             col="#ce1301", alpha=0.3,shininess=10,lit=FALSE)
## End(Not run)



