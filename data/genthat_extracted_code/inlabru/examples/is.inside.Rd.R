library(inlabru)


### Name: is.inside
### Title: Query if a point is inside the mesh boundary
### Aliases: is.inside
### Keywords: internal

### ** Examples

## No test: 
if (require("INLA", quietly = TRUE)) {
# Load Gorilla data

data("gorillas", package = "inlabru")

# Check if all Gorilla nests are inside the mesh

all(is.inside(gorillas$mesh, gorillas$nests))

# Also works for locations not stored as SpatialPoints object

loc = coordinates(gorillas$nests)
all(is.inside(gorillas$mesh, loc))
}
## End(No test)



