library(phylobase)


### Name: ancestor
### Title: Tree traversal and utility functions
### Aliases: ancestor children descendants siblings ancestors siblings

### ** Examples


  data(geospiza)
  nodeLabels(geospiza) <- LETTERS[1:nNodes(geospiza)]
  plot(as(geospiza, "phylo4"), show.node.label=TRUE)
  ancestor(geospiza, "E")
  children(geospiza, "C")
  descendants(geospiza, "D", type="tips")
  descendants(geospiza, "D", type="all")
  ancestors(geospiza, "D")
  MRCA(geospiza, "conirostris", "difficilis", "fuliginosa")
  MRCA(geospiza, "olivacea", "conirostris")

  ## shortest path between 2 nodes
  shortestPath(geospiza, "fortis", "fuliginosa")
  shortestPath(geospiza, "F", "L")

  ## branch length from a tip to the root
  sumEdgeLength(geospiza, ancestors(geospiza, "fortis", type="ALL"))



