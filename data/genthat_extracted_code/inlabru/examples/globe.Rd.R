library(inlabru)


### Name: globe
### Title: Plot a globe using rgl
### Aliases: globe

### ** Examples

## No test: 
if (require("rgl", quietly = TRUE) &&
    require("sphereplot", quietly = TRUE)) {

# Load pantropoical dolphin data

data("mexdolphin", package = "inlabru")

# Show the globe

globe()

# Add mesh, ship transects and dolphin sightings stored
# as inla.mesh, SpatialLines and SpatialPoints objects, respectively

glplot(mexdolphin$mesh)
glplot(mexdolphin$samplers)
glplot(mexdolphin$points)

}
## End(No test)



