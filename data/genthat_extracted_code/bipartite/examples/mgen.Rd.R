library(bipartite)


### Name: mgen
### Title: Generate simulated network according to a given probability
###   matrix
### Aliases: mgen

### ** Examples

## Generate simulated matrix from homogeneous probability matrix
probmat <- matrix(1/100, 10, 10)
mgen(web=probmat, n=100)

## Generate binary matrix with probability proportional to degree
## of an observed binary matrix m
obs.mat <- matrix(c(1,1,1,1,1,1,1,1,1,0,1,1,1,0,0,1,1,0,0,0,1,0,0,0,0), 5, 5)
rs <- rowSums(obs.mat)
cs <- colSums(obs.mat)
web <- rs %*% t(cs)
web <- web/sum(web)
n = sum(obs.mat)
mgen(web, n, keep.species=FALSE, rep.cell=FALSE) # Allowing zero marginal sums
mgen(web, n, keep.species=TRUE, rep.cell=FALSE) # Not allowing zero marginal sums

## Generate quantitative matrix with probability proportional
## to interaction frequency in an observed matrix m (which is the default of 'autotransform'):
mgen(mosquin1967, keep.species=FALSE, rep.cell=TRUE) # Allowing zero marginal sums
mgen(mosquin1967, keep.species=TRUE, rep.cell=TRUE) # Not allowing zero marginal sums



