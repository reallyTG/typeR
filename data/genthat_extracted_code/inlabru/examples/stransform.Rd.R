library(inlabru)


### Name: stransform
### Title: Coordinate transformation for spatial objects
### Aliases: stransform

### ** Examples

## No test: 
# Load Gorilla data
data("gorillas", package = "inlabru")

# Take the mesh and transform it to latitude/longitude
tmesh = stransform(gorillas$mesh, crs = CRS("+proj=longlat"))

# Compare original and transformed mesh

multiplot(ggplot() + gg(gorillas$mesh) + ggtitle("Original mesh"),
          ggplot() + gg(tmesh) + ggtitle("Transformed mesh"))
## End(No test)         



