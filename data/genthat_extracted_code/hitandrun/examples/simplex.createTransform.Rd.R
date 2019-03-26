library(hitandrun)


### Name: simplex.createTransform
### Title: Transform points on an (n-1)-simplex to n-dimensional space
### Aliases: simplex.createTransform
### Keywords: simplex transform

### ** Examples

E <- 1E-12 # Allowed numerical error

# The origin in (n-1)-dimensional space should be the centroid of the simplex
# when transformed to n-dimensional space
transform <- simplex.createTransform(3)
x <- transform %*% c(0, 0, 1)
x
stopifnot(abs(x - c(1/3, 1/3, 1/3)) < E)

# The same should hold for the inverse transformation
invTransform <- simplex.createTransform(3, inverse=TRUE)
y <- invTransform %*% c(1/3, 1/3, 1/3, 1)
y
stopifnot(abs(y - c(0, 0, 1)) < E)

# Of course, an arbitrary weight vector should transform back to itself
transform <- simplex.createTransform(3, keepHomogeneous=TRUE)
x <- c(0.2, 0.5, 0.3, 1.0)
y <- transform %*% invTransform %*% x
y
stopifnot(abs(y - x) < E)

# And we can apply the tranform to a matrix:
a <- cbind(x, x, x)
b <- transform %*% invTransform %*% a
b
stopifnot(abs(b - a) < E)



