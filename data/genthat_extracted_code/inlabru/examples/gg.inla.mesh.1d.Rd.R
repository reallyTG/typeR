library(inlabru)


### Name: gg.inla.mesh.1d
### Title: Geom for inla.mesh.1d objects
### Aliases: gg.inla.mesh.1d

### ** Examples

## No test: 
# Some features use the INLA package.
if (require("INLA", quietly = TRUE)) {

# Load INLA

library(INLA)

# Create a 1D mesh

mesh = inla.mesh.1d(seq(0,10,by=0.5))

# Plot it

ggplot() + gg(mesh)

# Plot it using a different shape and size for the mesh nodes

ggplot() + gg(mesh, shape = "|", size = 5)

}
## End(No test)



