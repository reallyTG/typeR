library(inlabru)


### Name: pixels
### Title: Generate 'SpatialPixels' covering an 'inla.mesh'
### Aliases: pixels

### ** Examples

## No test: 
data("mrsea")
pxl = pixels(mrsea$mesh, nx = 50, ny = 50)
ggplot() + gg(pxl) + gg(mrsea$mesh)
## End(No test)



