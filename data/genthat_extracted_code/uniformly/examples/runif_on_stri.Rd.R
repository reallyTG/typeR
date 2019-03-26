library(uniformly)


### Name: runif_on_stri
### Title: Uniform sampling on a spherical triangle
### Aliases: runif_on_stri

### ** Examples

# sampling on the first orthant:
sims <- runif_on_stri(100, v1=c(1,0,0), v2=c(0,1,0), v3=c(0,0,1))
## Not run: 
##D library(rgl)
##D spheres3d(0, 0, 0, color="red", alpha=0.5)
##D points3d(sims)
## End(Not run)



