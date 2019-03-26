library(HiveR)


### Name: rcsr
### Title: Compute the Details of a 3D Spline for a Hive Plot Edge
### Aliases: rcsr
### Keywords: 3D spline utilities

### ** Examples


# This is a lengthy example to prove it works.
# Read it and then copy the whole thing to a blank script.
# Parts of it require rgl and are interactive.
# So none of the below is run during package build/check.

### First, a helper function
## Not run: 
##D 
##D drawUnitCoord <- function() {
##D 	
##D 	# Simple function to draw a unit 3D coordinate system
##D 	
##D 	# Draw a Coordinate System
##D 	
##D 	r <- c(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1) # in polar coordinates
##D 	theta <- c(0, 0, 0, 90, 0, 180, 0, 270, 0, 0, 0, 0)  # start, end, start, end
##D 	phi <- c(0, 90, 0, 90, 0, 90, 0, 90, 0, 0, 0, 180)
##D 	cs <- data.frame(radius = r, theta, phi)
##D 	ax.coord <- sph2cart(cs)
##D 	
##D 	segments3d(ax.coord, col = "gray", line_antialias = TRUE)
##D 	points3d(x = 0, y = 0, z = 0, color = "black", size = 4,
##D 		point_antialias = TRUE) # plot origin
##D 	
##D 	# Label the axes
##D 
##D 	r <- c(1.1, 1.1, 1.1, 1.1, 1.1, 1.1) # in polar coordinates
##D 	theta <- c(0, 90, 180, 270, 0, 0)
##D 	phi <- c(90, 90, 90, 90, 0, 180)
##D 	l <- data.frame(radius = r, theta, phi)
##D 	lab.coord <- sph2cart(l)
##D 	text3d(lab.coord, texts = c("+x", "+y", "-x", "-y", "+z", "-z"))
##D 	
##D 	}
##D 
##D ###  Now, draw a reference coordinate system and demo the function in it.
##D 
##D drawUnitCoord()
##D 
##D ### Draw a bounding box
##D 
##D box <- data.frame( 
##D 	x = c(1, -1, 1, 1, 1, 1, 1, 1, 1, -1, -1, -1, 1, 1, 1, -1, 1, -1, -1, -1, -1, -1, -1, -1),
##D 	y = c(1, 1, 1, 1, 1, -1, 1, -1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, 1),
##D 	z = c(1, 1, 1, -1, 1, 1, -1, -1, -1, -1, 1, -1, 1, -1, 1, 1, -1, -1, -1, 1, 1, 1, -1, -1))
##D 
##D segments3d(box$x, box$y, box$z, line_antialias = TRUE, col = "red")
##D 
##D ### Draw the midlines defining planes
##D 
##D mid <- data.frame( 
##D 	x = c(0, 0, 0, 0, 0, 0, 0, 0, 1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 1, 1, 1),
##D 	y = c(-1, -1, -1, 1, 1, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, -1, 1, 1, 1, 1, -1),
##D 	z = c(-1, 1, 1, 1, 1, -1, -1, -1, -1, -1, -1, 1, 1, 1, 1, -1, 0, 0, 0, 0, 0, 0, 0, 0))
##D 
##D segments3d(mid$x, mid$y, mid$z, line_antialias = TRUE, col = "blue")
##D 
##D ### Generate two random points
##D 
##D p <- runif(6, -1, 1)
##D 
##D # Special case where p1 is on z axis
##D # Uncomment line below to demo
##D #p[4:5] <- 0
##D 
##D p0 <- c(p[1], p[2], p[3])
##D p1 <- c(p[4], p[5], p[6])
##D 
##D ### Draw the pts, label them, draw vectors to those pts from origin
##D 
##D segments3d(x = c(0, p[1], 0, p[4]),
##D 	y = c(0, p[2], 0, p[5]),
##D 	z = c(0, p[3], 0, p[6]),
##D 	line_antialias = TRUE, col = "black", lwd = 3)
##D 
##D points3d(x = c(p[1], p[4]),
##D 	y = c(p[2], p[5]),
##D 	z = c(p[3], p[6]),
##D 	point_antialias = TRUE, col = "black", size = 8)
##D 	
##D text3d(x = c(p[1], p[4]),
##D 	y = c(p[2], p[5]),
##D 	z = c(p[3], p[6]),
##D 	col = "black", texts = c("p0", "p1"), adj = c(1,1))
##D 
##D ### Locate control point
##D ### Compute and draw net vector from origin thru cp
##D ### Connect p0 and p1
##D 
##D s <- p0 + p1 
##D segments3d(x = c(0, s[1]), y = c(0, s[2]), z = c(0, s[3]),
##D 	line_antialias = TRUE, col = "grey", lwd = 3)
##D 
##D segments3d(x = c(p[1], p[4]), # connect p0 & p1
##D 	y = c(p[2], p[5]),
##D 	z = c(p[3], p[6]),
##D 	line_antialias = TRUE, col = "grey", lwd = 3)
##D 
##D cp <- 0.6*s # Now for the control point
##D 
##D points3d(x = cp[1], # Plot the control point
##D 	y = cp[2],
##D 	z = cp[3],
##D 	point_antialias = TRUE, col = "black", size = 8)
##D 
##D text3d(x = cp[1], # Label the control point
##D 	y = cp[2],
##D 	z = cp[3],
##D 	texts = c("cp"), col = "black", adj = c(1,1))
##D 
##D ### Now ready to work on the spline curve
##D 
##D n2 <- rcsr(p0, cp, p1) # Compute the spline
##D 
##D lines3d(x = n2[,1], y = n2[,2], z = n2[,3],
##D 	line_antialias = TRUE, col = "blue", lwd = 3)
##D 
##D ### Ta-Da!!!!!
## End(Not run)




