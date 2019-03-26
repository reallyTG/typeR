library(phylobase)


### Name: getNode
### Title: Node and Edge look-up functions
### Aliases: getNode getNode,phylo4-method getEdge getEdge-methods getEdge
###   getEdge,phylo4-method
### Keywords: misc

### ** Examples


  data(geospiza)
  nodeLabels(geospiza) <- LETTERS[1:nNodes(geospiza)]
  plot(as(geospiza, "phylo4"), show.node.label=TRUE)
  getNode(geospiza, 18)
  getNode(geospiza, "D")
  getEdge(geospiza, "D")
  getEdge(geospiza, "D", type="ancestor")

  ## match nodes only to tip nodes, flagging invalid cases as NA
  getNode(geospiza, c(1, 18, 999), type="tip", missing="OK")

  ## get all edges that descend from internal nodes
  getEdge(geospiza, type="ancestor")

  ## identify an edge from its terminal node
  getEdge(geospiza, c("olivacea", "B", "fortis"))
  getNode(geospiza, c("olivacea", "B", "fortis"))
  edges(geospiza)[c(26, 1, 11),]

  ## quickly get all tip node IDs and tip edge IDs
  nodeId(geospiza, "tip")
  edgeId(geospiza, "tip")




