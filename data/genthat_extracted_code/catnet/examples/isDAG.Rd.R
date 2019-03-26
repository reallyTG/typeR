library(catnet)


### Name: isDAG
### Title: Check Direct Acyclic Graph (DAG) Condition
### Aliases: isDAG
### Keywords: graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=20, maxParents=3, numCategories=2)
  isDAG(lnodes=cnet@nodes, lpars=cnet@parents)



