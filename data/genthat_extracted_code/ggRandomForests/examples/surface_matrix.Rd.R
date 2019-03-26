library(ggRandomForests)


### Name: surface_matrix
### Title: Construct a set of (x, y, z) matrices for surface plotting a
###   'gg_partial_coplot' object
### Aliases: surface_matrix surface_matrix.gg_partial_coplot

### ** Examples

## Not run: 
##D ## From vignette(randomForestRegression, package="ggRandomForests")
##D ##
##D data(rfsrc_Boston)
##D rm_pts <- quantile_pts(rfsrc_Boston$xvar$rm, groups=49, intervals=TRUE)
##D 
##D # Load the stored partial coplot data.
##D data(partial_Boston_surf)
##D 
##D # Instead of groups, we want the raw rm point values,
##D # To make the dimensions match, we need to repeat the values
##D # for each of the 50 points in the lstat direction
##D rm.tmp <- do.call(c,lapply(rm_pts, 
##D                            function(grp){rep(grp, length(partial_Boston_surf))}))
##D 
##D # Convert the list of plot.variable output to 
##D partial_surf <- do.call(rbind,lapply(partial_Boston_surf, gg_partial))
##D 
##D # attach the data to the gg_partial_coplot
##D partial_surf$rm <- rm.tmp
##D 
##D # Transform the gg_partial_coplot object into a list of three named matrices
##D # for surface plotting with plot3D::surf3D
##D srf <- surface_matrix(partial_surf, c("lstat", "rm", "yhat"))
## End(Not run)

## Not run: 
##D # surf3D is in the plot3D package.
##D library(plot3D)
##D # Generate the figure.
##D surf3D(x=srf$x, y=srf$y, z=srf$z, col=topo.colors(10),
##D        colkey=FALSE, border = "black", bty="b2", 
##D        shade = 0.5, expand = 0.5, 
##D        lighting = TRUE, lphi = -50,
##D        xlab="Lower Status", ylab="Average Rooms", zlab="Median Value"
##D )
## End(Not run)



