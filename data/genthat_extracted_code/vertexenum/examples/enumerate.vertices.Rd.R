library(vertexenum)


### Name: enumerate.vertices
### Title: Enumerate the vertices of a polytope.
### Aliases: enumerate.vertices
### Keywords: geometry

### ** Examples

library(vertexenum)
## example vertex enumeration
## the system Ax <= b represents a unit square, with
## the lower left corner at the origin

A <- rbind(c(-1, 0), c(0, 1), c(1, 0), c(0, -1))
b <- c(0, 1, 1, 0)
## outputs a 4 x 2 matrix, each row corresponds to a vertex
enumerate.vertices(A, b)

## second example
## this is a unit square, with lower left corner at the origin, missing
## a facet on the right side
A <- rbind(c(-1, 0), c(0, 1), c(0, -1))
b <- c(0, 1, 0)

## outputs a 2 x 2 matrix, each row corresponds to a vertex
## will print a warning, since the input set described by Ax <= b
## is not closed
enumerate.vertices(A, b, warn_if_open=TRUE)



