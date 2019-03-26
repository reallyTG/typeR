library(svgViewR)


### Name: svg.new
### Title: Create new Viewer file
### Aliases: svg.new

### ** Examples

## Not run: 
##D # Set number of points to draw
##D n <- 300
##D 
##D # Create a cloud of normally distributed 3D points
##D points3d <- cbind(rnorm(n, sd=3), rnorm(n, sd=2), rnorm(n, sd=1))
##D 
##D # Open a connection to .html file
##D svg.new(file='plot_static_points.html')
##D 
##D # Get distance of points from the center of point cloud
##D pdist <- sqrt(rowSums((points3d - matrix(colMeans(points3d), n, 3, byrow=TRUE))^2))
##D 
##D # Set color gradient between red and blue
##D colfunc <- colorRampPalette(c('red', 'blue'))
##D 
##D # Set desired number of colors along gradient
##D col_grad <- colfunc(50)
##D 
##D # Scale distances to indices and find corresponding color along gradient
##D col <- col_grad[(length(col_grad)-1)*(pdist - min(pdist)) / diff(range(pdist))+1]
##D 
##D # Add points to file
##D svg.points(points3d, col=col)
##D 
##D # Add a coordinate axis planes around the points
##D svg_frame <- svg.frame(points3d)
##D 
##D # Close the file connection
##D svg.close()
## End(Not run)



