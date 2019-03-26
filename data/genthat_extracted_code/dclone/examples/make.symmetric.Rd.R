library(dclone)


### Name: make.symmetric
### Title: Make a square matrix symmetric by averaging.
### Aliases: make.symmetric
### Keywords: manip

### ** Examples

x <- as.matrix(as.dist(matrix(1:25, 5, 5)))
diag(x) <- 100
x[lower.tri(x)] <- x[lower.tri(x)] - 0.1
x[upper.tri(x)] <- x[upper.tri(x)] + 0.1
x
make.symmetric(x)



