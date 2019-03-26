library(inlabru)


### Name: sample.lgcp
### Title: Sample from an inhomogeneous Poisson process
### Aliases: sample.lgcp

### ** Examples

## No test: 
# The INLA package is required
if (require("INLA", quietly = TRUE)) {

vertices = seq(0, 3, by = 0.1)
mesh = inla.mesh.1d(vertices)
loglambda = 5-0.5*vertices
pts = sample.lgcp(mesh, loglambda)
pts$y = 0
plot(vertices, exp(loglambda), type = "l", ylim = c(0,150))
points(pts, pch = "|" )

}
## End(No test)

## No test: 
# The INLA package is required
if (require("INLA", quietly = TRUE)) {

data("gorillas", package = "inlabru")
pts = sample.lgcp(gorillas$mesh,
                  loglambda = 1.5,
                  samplers = gorillas$boundary)
ggplot() + gg(gorillas$mesh) + gg(pts)

}
## End(No test)



