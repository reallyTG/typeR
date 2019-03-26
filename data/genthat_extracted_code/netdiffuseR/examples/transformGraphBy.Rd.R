library(netdiffuseR)


### Name: transformGraphBy
### Title: Apply a function to a graph considering non-diagonal structural
###   zeros
### Aliases: transformGraphBy transformGraphBy.diffnet
###   transformGraphBy.dgCMatrix

### ** Examples

# Rewiring a graph by community --------------------------------------------

# Two Random graphs of different size
set.seed(123)
g0 <- rgraph_ba(m=2, self=FALSE)
g1 <- rgraph_ba(m=3, t=19, self=FALSE)

# Need a place to store both networks together!
G <- methods::new(
  Class = "dgCMatrix",
  Dim   = c(1L,1L)*(nnodes(g0) + nnodes(g1)),
  p     = rep(0L, (nnodes(g0) + nnodes(g1)) + 1L)
  )

# Filling the matrix
G[1:nnodes(g0),1:nnodes(g0)]                              <- g0
G[(nnodes(g0) + 1):nnodes(G), (nnodes(g0) + 1):nnodes(G)] <- g1

# Creating an index (community)
indx <- c(rep(1, nnodes(g0)), rep(2, nnodes(g1)))

# Apply the rewiring algorithm per group
ans <- transformGraphBy(G, indx, function(g, ...) {
  rewire_graph(g, 100, "swap")
  })

ans





