library(inlabru)


### Name: lgcp
### Title: Log Gaussian Cox process (LGCP) inference using INLA
### Aliases: lgcp

### ** Examples


## No test: 

# Load the Gorilla data
data(gorillas, package = "inlabru")

# Plot the Gorilla nests, the mesh and the survey boundary
ggplot() + 
  gg(gorillas$mesh) + 
  gg(gorillas$nests) + 
  gg(gorillas$boundary) + 
  coord_fixed()

if (require("INLA", quietly = TRUE)) {
# Define SPDE prior
matern <- inla.spde2.pcmatern(gorillas$mesh, 
                              prior.sigma = c(0.1, 0.01), 
                              prior.range = c(5, 0.01))

# Define domain of the LGCP as well as the model components (spatial SPDE effect and Intercept)
cmp <- coordinates ~ mySmooth(map = coordinates, model = matern) + Intercept

# Fit the model
fit <- lgcp(cmp, gorillas$nests, samplers = gorillas$boundary)

# Predict the spatial intensity surface
lambda <- predict(fit, pixels(gorillas$mesh), ~ exp(mySmooth + Intercept))

# Plot the intensity
ggplot() + 
  gg(lambda) +
  gg(gorillas$mesh) + 
  gg(gorillas$nests) + 
  gg(gorillas$boundary) + 
  coord_fixed()

}
## End(No test)




