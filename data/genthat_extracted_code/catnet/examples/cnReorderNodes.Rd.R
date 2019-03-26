library(catnet)


### Name: cnReorderNodes-method
### Title: Reorder Network Nodes
### Aliases: cnReorderNodes cnReorderNodes,catNetwork,vector-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxParents=3, numCategories=2)
  cnMatParents(cnet)
  cnet1 <- cnReorderNodes(object=cnet, nodeIndices=cnOrder(cnet))
  cnNodes(object=cnet1)
  cnMatParents(cnet1)



