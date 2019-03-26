library(phylobase)


### Name: nodeId
### Title: nodeId methods
### Aliases: nodeId nodeId,phylo4-method edgeId edgeId,phylo4-method

### ** Examples

  data(geospiza)
  identical(nodeId(geospiza, "tip"), 1:nTips(geospiza))
  nodeId(geospiza, "internal")
  edgeId(geospiza, "internal")
  nodeId(geospiza, "root")



