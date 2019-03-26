library(geometry)


### Name: cart2bary
### Title: Conversion of Cartesian to Barycentric coordinates.
### Aliases: cart2bary

### ** Examples

## Define simplex in 2D (i.e. a triangle)
X <- rbind(c(0, 0),
           c(0, 1),
           c(1, 0))
## Cartesian cooridinates of points
P <- rbind(c(0.5, 0.5),
           c(0.1, 0.8))
## Plot triangle and points
trimesh(rbind(1:3), X)
text(X[,1], X[,2], 1:3) # Label vertices
points(P)
cart2bary(X, P)



