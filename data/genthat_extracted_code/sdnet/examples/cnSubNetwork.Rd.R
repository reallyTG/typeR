library(sdnet)


### Name: cnSubNetwork-method
### Title: Sub-Network
### Aliases: cnSubNetwork cnSubNetwork,catNetwork-method
###   cnSubNetwork,catNetwork,vector,logical-method
### Keywords: methods graphs

### ** Examples

  cnet <- cnRandomCatnet(numnodes=10, maxpars=3, numcats=2)
  cnet1 <- cnSubNetwork(object=cnet, nodeIndices=c(1,2,3,4,5), indirectEdges=TRUE)
  cnNodes(object=cnet)
  cnNodes(object=cnet1)



