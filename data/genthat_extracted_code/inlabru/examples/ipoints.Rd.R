library(inlabru)


### Name: ipoints
### Title: Generate integration points
### Aliases: ipoints

### ** Examples

## No test: 
if (require("INLA", quietly = TRUE)) {

# Create 50 integration points covering the dimension 'myDim' between 0 and 10. 

ips = ipoints(c(0,10), 50, name = "myDim")
plot(ips)

# Create integration points for the two intervals [0,3] and [5,10]

ips = ipoints(matrix(c(0,3, 5,10), nrow = 2, byrow = TRUE), 50)
plot(ips)

# Convert a 1D mesh into integration points
mesh = inla.mesh.1d(seq(0,10,by = 1))
ips = ipoints(mesh, name = "time")
plot(ips)


# Obtain 2D integration points from a SpatialPolygon

data(gorillas, package = "inlabru")
ips = ipoints(gorillas$boundary)
ggplot() + gg(gorillas$boundary) + gg(ips, aes(size = weight))


#' Project integration points to mesh vertices

ips = ipoints(gorillas$boundary, domain = gorillas$mesh)
ggplot() + gg(gorillas$mesh) +  gg(gorillas$boundary) + gg(ips, aes(size = weight))


# Turn a 2D mesh into integration points

ips = ipoints(gorillas$mesh)
ggplot() + gg(gorillas$boundary) + gg(ips, aes(size = weight))
}
## End(No test)



