library(ape)


### Name: vcv2phylo
### Title: Variance-Covariance Matrix to Tree
### Aliases: vcv2phylo
### Keywords: manip multivariate

### ** Examples

tr <- rtree(10)
V <- vcv(tr) # VCV matrix assuming Brownian motion
z <- vcv2phylo(V)
identical(tr, z) # FALSE
all.equal(tr, z) # TRUE



