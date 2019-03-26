library(icosa)


### Name: faces3d
### Title: Methods of 3d face plotting.
### Aliases: faces3d faces3d, faces3d,facelayer-method
###   faces3d,hexagrid-method faces3d,trigrid-method
###   faces3d-hexagrid-method faces3d-trigrid-method

### ** Examples

# create a hexagonal grid
    g <- hexagrid(c(2,2))
# plot the grid in 3d space
    plot3d(g)
# make a subset to select faces
   subG <- subset(g, c("F5", "F2"))
# plot the subset defined above
    faces3d(subG, col="orange")



