library(linkcomm)


### Name: graph.feature
### Title: Make Node or Edge Graph Features
### Aliases: graph.feature

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Make node size vector for all nodes that belong to community 1.
graph.feature(lc, indices = getNodesIn(lc, type = "indices"), features = 20, default = 5)

## Make edge width vector for all edges that belong to community 1.
graph.feature(lc, type = "edges", indices = getEdgesIn(lc), features = 5, default = 1)



