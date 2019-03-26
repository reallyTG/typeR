library(phylobase)


### Name: summary-methods
### Title: Summary for phylo4/phylo4d objects
### Aliases: summary-methods summary summary,phylo4-method
###   summary,phylo4d-method nodeType nodeType,phylo4-method
### Keywords: methods

### ** Examples

  tOwls <- "(((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3):6.3,Tyto_alba:13.5);"
  tree.owls <- ape::read.tree(text=tOwls)
  P1 <- as(tree.owls, "phylo4")
  P1
  summary(P1)
  nodeType(P1)

  ## summary of a polytomous tree
  E <- matrix(c(
      8,  9,
      9, 10,
     10,  1,
     10,  2,
      9,  3,
      9,  4,
      8, 11,
     11,  5,
     11,  6,
     11,  7,
      0,  8), ncol=2, byrow=TRUE)

  P2 <- phylo4(E)
  nodeLabels(P2) <- as.character(nodeId(P2, "internal"))
  plot(P2, show.node.label=TRUE)
  sumryP2 <- summary(P2)
  sumryP2




