library(phylobase)


### Name: edges
### Title: Edges accessors
### Aliases: edges edges,phylo4-method edgeOrder edgeOrder,phylo4-method
###   internalEdges internalEdges,phylo4-method terminalEdges
###   terminalEdges,phylo4-method

### ** Examples

   data(geospiza)
   edges(geospiza)
   edgeOrder(geospiza)
   geoPost <- reorder(geospiza, "postorder")
   edgeOrder(geoPost)
   ## with a binary tree this should always be true
   identical(!terminalEdges(geospiza), internalEdges(geospiza))



