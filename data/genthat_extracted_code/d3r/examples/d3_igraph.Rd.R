library(d3r)


### Name: d3_igraph
### Title: Convert 'igraph' to 'd3.js'
### Aliases: d3_igraph

### ** Examples

## Not run: 
##D library(igraph)
##D library(igraphdata)
##D library(d3r)
##D 
##D # with random graph
##D d3r::d3_igraph(igraph::sample_pa(100))
##D 
##D # check case where vertices 0 cols
##D d3_igraph(igraph::watts.strogatz.game(1, 50, 4, 0.05))
##D 
##D # with karate from igraphdata
##D #  notice graph attributes are added
##D data("karate",package="igraphdata")
##D (karate_d3 <- d3r::d3_igraph(karate))
##D 
##D listviewer::jsonedit(karate_d3)
##D 
##D data("kite",package="igraphdata")
##D listviewer::jsonedit(d3_igraph(kite))
## End(Not run)



