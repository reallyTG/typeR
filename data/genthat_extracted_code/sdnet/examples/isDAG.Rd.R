library(sdnet)


### Name: isDAG
### Title: Check Direct Acyclic Graph (DAG) Condition
### Aliases: isDAG
### Keywords: graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=20, maxpars=3, numcats=2)
  isDAG(lnodes=cnet@nodes, lpars=cnet@pars)



