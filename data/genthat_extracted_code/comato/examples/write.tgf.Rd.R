library(comato)


### Name: write.tgf
### Title: Saving a concept map to a TGF file
### Aliases: write.tgf

### ** Examples

## Not run: 
##D #Create concept map from a random graph
##D require("igraph")
##D g1 = set.vertex.attribute(erdos.renyi.game(5, 0.7, type="gnp"), "name", value=1:5)
##D 
##D write.tgf(conceptmap(g1), "~/cmap.tgf", 
##D           translation = c("Node_1", "Node_2", "Node_3", "Node_4", "Node_5"))
## End(Not run)



