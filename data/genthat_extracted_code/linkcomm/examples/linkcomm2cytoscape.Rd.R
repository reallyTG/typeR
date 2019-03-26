library(linkcomm)


### Name: linkcomm2cytoscape
### Title: Write an Edge Attribute File for Cytoscape
### Aliases: linkcomm2cytoscape

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Write an edge attribute file to disk.
linkcomm2cytoscape(lc)



