library(icosa)


### Name: guides3d
### Title: Guides for 3d spherical plotting.
### Aliases: guides3d

### ** Examples

# create a hexagonal grid
    g <- hexagrid(c(2,2))
# plot the grid in 3d space
   plot3d(g, guides=FALSE)
# plot the rotational axis in blue
		guides3d(axis=2, polgrid=NULL, col="blue")
# plot the polar grid at 10 degree resolution
    guides3d(axis=NULL, polgrid=c(10,10), col="red")
# plot some coordinates
   guides3d(axis=NULL, polgrid=c(30,30), textPG=TRUE, col="orange", cex=1.4)



