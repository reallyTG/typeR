library(SyNet)


### Name: netproperties
### Title: Structural Properties of an Unweighted Undirected Network
### Aliases: netproperties
### Keywords: methods

### ** Examples

  # "A" corresponds to the 0-1 adjacency matrix
  # associated to a simple graph of 10 nodes
  # The main diagonal has zeroes.
  A <- matrix(0, 10, 10)
  A[lower.tri(A)] <- ifelse(runif(5*9) < 0.5, 1, 0)
  pmin(A + t(A), 1) -> A
  netproperties(A)



