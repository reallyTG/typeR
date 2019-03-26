library(maptree)


### Name: group.clust
### Title: Observation Groups for a Hierarchical Cluster Tree
### Aliases: group.clust
### Keywords: manip cluster

### ** Examples

  data (oregon.bird.dist, oregon.grid)

  group <- group.clust (hclust (dist (oregon.bird.dist)), k=6)
  names(group) <- row.names(oregon.bird.dist)
  map.groups (oregon.grid, group)



