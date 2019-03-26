## ------------------------------------------------------------------------
library(diffusr)

## ---- message=F, warning=F-----------------------------------------------
  # count of nodes
  n <- 5
  # starting distribution (has to sum to one)
  p0    <- as.vector(rmultinom(1, 1, prob=rep(.2, n)))
  # adjacency matrix (either normalized or not)
  graph <- matrix(abs(rnorm(n*n)), n, n)
  # computation of stationary distribution
  pt    <- random.walk(p0, graph)

## ------------------------------------------------------------------------
  print(t(p0))
  print(t(pt))

## ---- message=F, warning=F-----------------------------------------------
   p0 <- matrix(c(p0, runif(20)), nrow=n)
   pt <- random.walk(p0, graph)
   pt

## ---- message=F, warning=F-----------------------------------------------
   pt <- random.walk(p0, graph, do.analytical=TRUE)
   pt

## ---- message=F, warning=F-----------------------------------------------
  # count of nodes
  n <- 10
  # indexes(integer) of nodes for which neighbors should be searched
  node.idxs <- c(1L, 5L)
  # the adjaceny matrix (does not need to be symmetric)
  graph <- rbind(cbind(0, diag(n-1)), 0)
  # compute the neighbors until depth 3
  neighs <- nearest.neighbors(node.idxs, graph, 3)

## ------------------------------------------------------------------------
  print(neighs)

## ---- message=F, warning=F-----------------------------------------------
  # count of nodes
  n <- 5
  # starting distribution (has to sum to one)
  h0    <- as.vector(rmultinom(1, 1, prob=rep(.2, n)))
  # adjacency matrix (either normalized or not)
  graph <- matrix(abs(rnorm(n*n)), n, n)
  # computation of stationary distribution
  ht    <- heat.diffusion(h0, graph)

## ------------------------------------------------------------------------
  print(t(h0))
  print(t(ht))

## ---- message=F, warning=F-----------------------------------------------
   h0 <- matrix(c(h0, runif(20)), nrow=n)
   ht <- heat.diffusion(h0, graph)
   ht

