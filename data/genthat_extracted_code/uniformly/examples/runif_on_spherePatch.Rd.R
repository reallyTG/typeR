library(uniformly)


### Name: runif_on_spherePatch
### Title: Uniform sampling on a spherical patch
### Aliases: runif_on_spherePatch

### ** Examples

# sampling on the first orthant:
sims <- runif_on_spherePatch(100, phi1=0, phi2=pi/2, theta1=0, theta2=pi/2)
## Not run: 
##D library(rgl)
##D spheres3d(0, 0, 0, color="red", alpha=0.5)
##D points3d(sims)
## End(Not run)



