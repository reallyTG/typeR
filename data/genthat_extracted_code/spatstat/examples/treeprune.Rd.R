library(spatstat)


### Name: treeprune
### Title: Prune Tree to Given Level
### Aliases: treeprune
### Keywords: spatial manip

### ** Examples

  # make a simple tree
  m <- simplenet$m
  m[8,10] <- m[10,8] <- FALSE
  L <- linnet(vertices(simplenet), m)
  plot(L, main="")
  # compute branch labels 
  tb <- treebranchlabels(L, 1)
  tbc <- paste0("[", tb, "]")
  text(vertices(L), labels=tbc, cex=2)
  # prune tree 
  tp <- treeprune(L, root=1, 1)
  plot(tp, add=TRUE, col="blue", lwd=3)



