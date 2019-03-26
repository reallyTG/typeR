library(ptinpoly)


### Name: pip2d
### Title: Test for Point Containment in 2D Polygon
### Aliases: pip2d
### Keywords: methods

### ** Examples

#-------------------------------------------
# Load sample data defining a comb, spiral, and fractal. 
data(comb)
data(spiral)
data(fractal)

# Plot the comb, spiral, and fractal.
plot(rbind(comb,comb[1,]),type="l")
plot(rbind(spiral,spiral[1,]),type="l")
plot(rbind(fractal,fractal[1,]),type="l")

# Generate 3333 random test points.
set.seed(1902)
n       <- 3333
x1      <- rnorm(n) ; x2 <- rnorm(n)
X       <- cbind(x1,x2)
queries <- as.matrix(X)

# Check whether test points are contained in the comb, spiral, and factal.
# Most of these points will lie outside the polygons.
containment1 <- pip2d(comb,queries);
containment2 <- pip2d(spiral,queries);
containment3 <- pip2d(fractal,queries);



