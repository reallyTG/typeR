library(igraph)


### Name: ivs
### Title: Independent vertex sets
### Aliases: ivs independent.vertex.sets largest.independent.vertex.sets
###   maximal.independent.vertex.sets independence.number ivs_size
###   largest_ivs maximal_ivs
### Keywords: graphs

### ** Examples


# Do not run, takes a couple of seconds
## Not run: 
##D 
##D # A quite dense graph
##D set.seed(42)
##D g <- sample_gnp(100, 0.9)
##D ivs_size(g)
##D ivs(g, min=ivs_size(g))
##D largest_ivs(g)
##D # Empty graph
##D induced_subgraph(g, largest_ivs(g)[[1]])
##D 
##D length(maximal_ivs(g))
## End(Not run)



