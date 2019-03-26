library(SyNet)


### Name: stablecouple
### Title: Stable Matching Derived from Spatial Affinity Matrices
### Aliases: stablecouple
### Keywords: methods

### ** Examples

  data(mayflynz)
  aux <- procdnpoint(mayflynz)
  mtx1 <- acsh(aux) # Construct the dissimilarity matrix between species sets of points.
  mtx2 <- toposimilar(aux) # Now, construct the similarity matrix
  st1 <- stablecouple(mtx1, similarity = FALSE) #Stable matchings under mtx1
  st2 <- stablecouple(mtx2) #Stable matchings under mtx2
  #Following, plots the same set of species along three parallel axes.
  plot(rep(1:3, each = 40), rep(1:40, 3), main = "STABLE MATCHINGS", axes = FALSE,
       ylab = "", xlab = "", pch = 19)
  mtext("Couplings induced by mtx1", side = 1, line = 1, at = 1.5)
  mtext("(dissimilarity matrix)", side = 1, line = 2, at = 1.5)
  mtext("Couplings induced by mtx2", side = 1, line = 1, at = 2.5)
  mtext("(similarity matrix)", side = 1, line = 2, at = 2.5)
  #Each matching is represented by a segment. Self-matchings are horizontal
  #line segments. Note that symmetry means identical behavior of the involved
  #pair of taxa along the profiles of stable couplings.
  segments(rep(1, 40), 1:40, rep(2, 40), st1$stpairs, col = 2, lwd = 2)
  segments(rep(2, 40), 1:40, rep(3, 40), st2$stpairs, col = 2, lwd = 2)



