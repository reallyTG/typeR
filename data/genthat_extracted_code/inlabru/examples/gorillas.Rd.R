library(inlabru)


### Name: gorillas
### Title: Gorilla Nesting Sites.
### Aliases: gorillas

### ** Examples

data(gorillas, package = "inlabru") # get the data
# extract all the objects, for convenience:

# plot all the nests, mesh and boundary
ggplot() + gg(gorillas$mesh) + gg(gorillas$boundary) + gg(gorillas$nests)

# Plot the elevation covariate
plot(gorillas$gcov$elevation)

# Plot the plot sample
ggplot() + gg(gorillas$plotsample$plots) + gg(gorillas$plotsample$nests)



