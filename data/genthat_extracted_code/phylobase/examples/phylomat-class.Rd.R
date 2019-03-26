library(phylobase)


### Name: phylomat-class
### Title: matrix classes for phylobase
### Aliases: phylomat-class phylo4vcov-class as_phylo4vcov phylomat-setAs
###   setAs,phylo,phylo4vcov-method phylomat-setAs
###   setAs,phylo4vcov,phylo4-method
### Keywords: classes

### ** Examples

  tree_string <- "(((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3):6.3,Tyto_alba:13.5);"
  tree.owls <- ape::read.tree(text=tree_string)
  o2 <- as(tree.owls,"phylo4")
  ov <- as(o2,"phylo4vcov")
  o3 <- as(ov,"phylo4")
  ## these are not completely identical, but are
  ## topologically identical ...

  ## edge matrices are in a different order:
  ## cf. edges(o2) and edges(o3)
  ## BUT the edge matrices are otherwise identical
  o2edges <- edges(o2)
  o3edges <- edges(o3)
  identical(o2edges[order(o2edges[,2]),],
            o3edges[order(o3edges[,2]),])

  ## There is left/right ambiguity here in the tree orders:
  ## in o2 the 5->6->7->1 lineage
  ## (terminating in Strix aluco)
  ## is first, in o3 the 5->6->3 lineage
  ## (terminating in Athene noctua) is first.





