library(rcdd)


### Name: scdd
### Title: Go between H-representation and V-representation of convex
###   polyhedron
### Aliases: scdd
### Keywords: misc

### ** Examples

d <- 4
# unit simplex in H-representation
qux <- makeH(- diag(d), rep(0, d), rep(1, d), 1)
print(qux)
# unit simplex in V-representation
out <- scdd(qux)
print(out)
# unit simplex in H-representation
# note: different from original, but equivalent
out <- scdd(out$output)
print(out)

# add equality constraint
quux <- addHeq(1:d, (d + 1) / 2, qux)
print(quux)
out <- scdd(quux)
print(out)

# use some options
out <- scdd(quux, roworder = "maxcutoff", adjacency = TRUE)
print(out)

# convex hull
np <- 50
x <- matrix(rnorm(d * np), ncol = d)
foo <- cbind(0, cbind(1, x))
out <- scdd(d2q(foo), inputincidence = TRUE, representation = "V")
boundies <- sapply(out$inputincidence, length) > 0
sum(boundies) ## number of points on boundary of convex hull



