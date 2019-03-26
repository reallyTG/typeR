library(catnet)


### Name: cnCompare-method
### Title: Network Comparison
### Aliases: cnCompare cnCompare,catNetwork,catNetwork-method
###   cnCompare,catNetwork,matrix-method cnCompare,catNetwork,list-method
###   cnCompare,catNetwork,catNetworkEvaluate-method
### Keywords: methods graphs

### ** Examples

  cnet1 <- cnRandomCatnet(numnodes=10, maxParents=2, numCategories=2)
  cnet2 <- cnRandomCatnet(numnodes=10, maxParents=2, numCategories=2)
  dist <- cnCompare(object1=cnet1, object2=cnet2)
  dist



