library(icosa)


### Name: plot3d,trigrid-method
### Title: 3d plotting of an icosahedral grid or its subset
### Aliases: plot3d, plot3d,hexagrid-method plot3d,trigrid-method
###   plot3d-hexagrid-method plot3d-trigrid-method

### ** Examples

# create a hexagonal grid
    g <- hexagrid(c(2,2))
# plot the grid in 3d space
    plot3d(g, col="blue")
# make a subset to select faces
   subG <- subset(g, c("F5", "F2"))
# plot the subset defined above
    plot3d(subG, type="f", col=c("orange"), add=TRUE, lwd=1)



