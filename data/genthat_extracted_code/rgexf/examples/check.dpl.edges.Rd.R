library(rgexf)


### Name: check.dpl.edges
### Title: Check (and count) duplicated edges
### Aliases: check.dpl.edges
### Keywords: manip

### ** Examples

  # An edgelist with duplicated dyads
  relations <- cbind(c(1,1,3,4,2,5,6), c(2,3,1,2,4,1,1))
  
  # Checking duplicated edges (undirected graph)
  check.dpl.edges(edges=relations, undirected=TRUE)



