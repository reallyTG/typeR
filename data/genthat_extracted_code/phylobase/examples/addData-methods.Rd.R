library(phylobase)


### Name: addData
### Title: Adding data to a phylo4 or a phylo4d object
### Aliases: addData addData,phylo4d-method addData-methods
###   addData,phylo4-method addData,phylo4-method addData,phylo4d-method
### Keywords: methods

### ** Examples

  data(geospiza)
  nDt <- data.frame(a=rnorm(nNodes(geospiza)), b=1:nNodes(geospiza),
                    row.names=nodeId(geospiza, "internal"))
  t1 <- addData(geospiza, node.data=nDt)



