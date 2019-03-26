library(dissUtils)


### Name: neighbor.density
### Title: Calculate Multidimensional Densities from Neighbor Distances
### Aliases: neighbor.density
### Keywords: multivariate

### ** Examples


## The function is currently defined as
function (neigh.dists, D, k, N)
{
    radius <- unit.hypersphere.volume(D)
    return(k/(N * radius * neigh.dists))
  }



