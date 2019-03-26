library(lambda.tools)


### Name: mapblock
### Title: Apply a function over blocks of a vector
### Aliases: mapblock

### ** Examples

# Apply multiple rotation matrices to a set of points
a <- matrix(sample(12, 20, replace=TRUE), nrow=2)
theta <- 2 * pi * sample(360,4, replace=TRUE) / 360
b <- fold(theta, function(d,acc)
  cbind(acc,matrix(c(cos(d),sin(d),-sin(d),cos(d)), nrow=2)), c())
z <- mapblock(b, 2, function(m) m %*% a, simplify=FALSE)

# The 1D version is equivalent to a 2D map
x <- 1:24
mapblock(x, 4, sum) == map(matrix(x,nrow=4), sum)




