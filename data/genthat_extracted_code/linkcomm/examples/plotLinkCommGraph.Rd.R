library(linkcomm)


### Name: plotLinkCommGraph
### Title: Plot a Graph Layout of Link Communities
### Aliases: plotLinkCommGraph

### ** Examples

## Generate graph and extract link communities.
g <- swiss[,3:4]
lc <- getLinkCommunities(g)

## Plot a graph of link communities.
plot(lc, type = "graph")

## Plot a graph of link communities using a Spencer circle layout.
plot(lc, type = "graph", layout = "spencer.circle")



