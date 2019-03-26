library(svgViewR)


### Name: svg.pathsC
### Title: Connect points with path lines in SVG Viewer
### Aliases: svg.pathsC

### ** Examples

## Transform a circle into an ellipse
# Create new viewer
svg.new(file='svgviewr.html', animate.reverse=TRUE, animate.duration=1)

# Create points
n <- 100
x <- array(NA, dim=c(100, 2, n))
x_seq <- seq(-1, 1, length=dim(x)[1]/2)
x_seq <- sin(seq(-pi/2, pi/2, length=dim(x)[1]/2))
n_seq <- seq(1, 3, length=n)
for(i in 1:dim(x)[3])
	x[, , i] <- rbind(cbind(x_seq, n_seq[i]*sqrt(1 - x_seq^2)),
		cbind(x_seq[(dim(x)[1]/2):1], -n_seq[i]*sqrt(1 - x_seq[(dim(x)[1]/2):1]^2)))

# Draw points
svg.points(x, cex=1, lwd=1, col="blue")

# Draw paths among points
svg.pathsC(1:dim(x)[1], col.fill="blue", opacity.fill=0.1, 
	col.stroke="green", lwd=2, z.index=-1)

# Close viewer connection
svg.close()

# Open svgviewr.html to visualize



