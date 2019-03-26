library(ptinpoly)


### Name: fractal
### Title: Sample Data: Fractal Polygon
### Aliases: fractal
### Keywords: datasets

### ** Examples

# Load polygon.
data(fractal)

# Plot the polygon.
plot(rbind(fractal,fractal[1,]),type="l")

# Generate 3333 random test points.
set.seed(1902)
n       <- 3333
x1      <- rnorm(n) ; x2 <- rnorm(n)
X       <- cbind(x1,x2)
queries <- as.matrix(X)

# Check whether test points are contained in the polygon.
# Most of these points will lie outside the polygon.
containment = pip2d(fractal,queries);



