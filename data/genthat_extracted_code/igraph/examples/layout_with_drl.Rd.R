library(igraph)


### Name: layout_with_drl
### Title: The DrL graph layout generator
### Aliases: layout_with_drl layout.drl drl_defaults igraph.drl.coarsen
###   igraph.drl.coarsest igraph.drl.default igraph.drl.final
###   igraph.drl.refine with_drl
### Keywords: graphs

### ** Examples


g <- as.undirected(sample_pa(100, m=1))
l <- layout_with_drl(g, options=list(simmer.attraction=0))
## Not run: 
##D plot(g, layout=l, vertex.size=3, vertex.label=NA)
## End(Not run)




