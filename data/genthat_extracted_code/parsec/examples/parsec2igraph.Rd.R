library(parsec)


### Name: parsec2igraph
### Title: Converting a partial order to an object of the package 'igraph'.
### Aliases: parsec2igraph parsec2igraph.cover parsec2igraph.incidence

### ** Examples

example(merge.wprof)
poset <- getzeta(distribution)
incidence2cover(poset)

G <- parsec2igraph(poset, noise = TRUE)
get.adjacency(G)
# tkplot(G, vertex.size = distribution$freq, vertex.color = "white")

G <- parsec2igraph(poset, noise = 10)
# tkplot(G, vertex.size = distribution$freq, vertex.color = "white")



