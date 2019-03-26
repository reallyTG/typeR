library(motmot.2.0)


### Name: cladeIdentity
### Title: Identify branches (including tips) descended from a node
###   (internal function).
### Aliases: cladeIdentity

### ** Examples

## Read in phylogeny and data from Thomas et al. (2009)
data(anolis.tree)
data(anolis.data)

cladeIdentityMatrix <- cladeIdentity(phy=anolis.tree, nodeIDs=170)



