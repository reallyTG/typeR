library(GNAR)


### Name: is.GNARnet
### Title: Functions to check and create GNARnet objects
### Aliases: is.GNARnet as.GNARnet

### ** Examples

#check that the example network meets the criteria above
data(fiveNode)
is.GNARnet(fiveNet)

#convert to igraph and back again
as.GNARnet(GNARtoigraph(fiveNet))

#generate a new network with three nodes
#edges 1->2, 2->1, 2->3
#dist 1, 2, 1
#note 1->2 and 2->1 are of different lengths
threeEdge <- list(c(2), c(1,3), NULL)
threeDist <- list(c(1), c(2,1), NULL)
threeNet <- list(edges=threeEdge, dist=threeDist)
#check if this is a GNARnet
is.GNARnet(threeNet)
#use as.GNARnet to change the class
threeNet <- as.GNARnet(threeNet)
#check if this is a GNARnet now
is.GNARnet(threeNet)



