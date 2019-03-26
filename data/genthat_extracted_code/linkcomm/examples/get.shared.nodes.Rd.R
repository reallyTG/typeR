library(linkcomm)


### Name: get.shared.nodes
### Title: Get Nodes Shared by Communities
### Aliases: get.shared.nodes

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Get shared nodes for communities 1 and 7.
get.shared.nodes(lc, comms = c(1,7))



