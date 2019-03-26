library(spatstat)


### Name: deletebranch
### Title: Delete or Extract a Branch of a Tree
### Aliases: deletebranch deletebranch.linnet deletebranch.lpp
###   extractbranch extractbranch.linnet extractbranch.lpp
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

  # delete branch B
  LminusB <- deletebranch(L, "b", tb)
  plot(LminusB, add=TRUE, col="green")

  # extract branch B
  LB <- extractbranch(L, "b", tb)
  plot(LB, add=TRUE, col="red")



