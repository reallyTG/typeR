library(phylotate)


### Name: parse_annotated
### Title: Parse an annotated phylogenetic tree
### Aliases: parse_annotated
### Keywords: phylo

### ** Examples

  # Parse the example data included with this package
  data(finches)
  t <- parse_annotated(finches, format="nexus")

  # Obtain annotations in edge-order, rather than node-order
  edge.comment <- t$node.comment[t$edge[,2]]



