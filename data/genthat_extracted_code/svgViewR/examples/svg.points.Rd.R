library(svgViewR)


### Name: svg.points
### Title: Write points to SVG Viewer
### Aliases: svg.points

### ** Examples

## Not run: 
##D ## Create animated sinusoid
##D # Create new viewer
##D svg.new(file='svgviewr.html', animate.duration=1)
##D 
##D # Create points with varying sin phase
##D n <- 100
##D x <- array(NA, dim=c(40, 2, n))
##D x_seq <- seq(-pi, pi, length=dim(x)[1])
##D n_seq <- seq(0, 2*pi, length=n)
##D for(i in 1:dim(x)[3]) x[, , i] <- cbind(x_seq, sin(x_seq + n_seq[i]))
##D 
##D # Draw points
##D svg.points(x, cex=2, lwd=1, col="blue")
##D 
##D # Close viewer connection
##D svg.close()
##D 
##D # Open svgviewr.html to visualize
## End(Not run)



