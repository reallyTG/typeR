library(rcdd)


### Name: makeV
### Title: make V-representation of convex polyhedron
### Aliases: makeV addVpoints addVrays addVlines
### Keywords: misc

### ** Examples

d <- 4
n <- 7
qux <- makeV(points = matrix(rnorm(n * d), ncol = d))
out <- scdd(qux)
out$output



