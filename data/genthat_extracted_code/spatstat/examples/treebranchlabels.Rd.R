library(spatstat)


### Name: treebranchlabels
### Title: Label Vertices of a Tree by Branch Membership
### Aliases: treebranchlabels
### Keywords: spatial math

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



