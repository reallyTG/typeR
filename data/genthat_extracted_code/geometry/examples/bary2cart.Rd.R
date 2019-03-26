library(geometry)


### Name: bary2cart
### Title: Conversion of Barycentric to Cartesian coordinates
### Aliases: bary2cart

### ** Examples

## Define simplex in 2D (i.e. a triangle)
X <- rbind(c(0, 0),
           c(0, 1),
           c(1, 0))
## Cartesian cooridinates of points
beta <- rbind(c(0, 0.5, 0.5),
              c(0.1, 0.8, 0.1))
## Plot triangle and points
trimesh(rbind(1:3), X)
text(X[,1], X[,2], 1:3) # Label vertices
P <- bary2cart(X, beta)
points(P)



