library(icosa)


### Name: gridlabs3d
### Title: Display the names of the grid elements in 3d plots.
### Aliases: gridlabs3d gridlabs3d, gridlabs3d,hexagrid-method
###   gridlabs3d,trigrid-method gridlabs3d-hexagrid-method
###   gridlabs3d-trigrid-method

### ** Examples

# create a hexagonal grid
    g <- hexagrid(c(2,2))
# plot the grid in 3d space
   plot3d(g, guides=FALSE)
# plot the names of the faces
		gridlabs3d(g, type="f", col="red")
# plot the names of the vertices
    gridlabs3d(g, type="v", col="blue", cex=0.6)



