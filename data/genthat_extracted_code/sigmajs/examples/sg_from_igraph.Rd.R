library(sigmajs)


### Name: sg_from_igraph
### Title: Create from igraph
### Aliases: sg_from_igraph

### ** Examples

## Not run: 
##D data("lesmis_igraph")
##D 
##D layout <- igraph::layout_with_fr(lesmis_igraph)
##D 
##D sigmajs() %>%
##D 	sg_from_igraph(lesmis_igraph, layout) %>%
##D 	sg_settings(defaultNodeColor = "#000")
## End(Not run)




