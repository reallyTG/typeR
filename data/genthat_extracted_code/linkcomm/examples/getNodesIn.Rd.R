library(linkcomm)


### Name: getNodesIn
### Title: Extract Nodes from Communities
### Aliases: getNodesIn

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Get nodes from community 1.
getNodesIn(lc)



