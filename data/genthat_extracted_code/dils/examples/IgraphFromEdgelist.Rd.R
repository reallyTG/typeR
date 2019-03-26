library(dils)


### Name: IgraphFromEdgelist
### Title: Convert an edgelist to an igraph
### Aliases: IgraphFromEdgelist

### ** Examples

edgelist <- cbind(expand.grid(letters[1:2], letters[1:2]), runif(4))
g <- IgraphFromEdgelist(edgelist)
get.edgelist(g)
E(g)$weight
plot(g, edge.width=5*E(g)$weight, edge.curved=TRUE)



