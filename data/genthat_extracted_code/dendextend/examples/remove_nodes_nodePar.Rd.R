library(dendextend)


### Name: remove_nodes_nodePar
### Title: Remove all nodePar values from a dendrogram's nodes
### Aliases: remove_nodes_nodePar

### ** Examples


## Not run: 
##D 
##D dend <- USArrests[1:5,] %>% dist %>% hclust %>% as.dendrogram
##D dend <- color_branches(dend, 3)
##D par(mfrow = c(1,2))
##D plot(dend)
##D plot(remove_branches_edgePar(dend))
##D 
## End(Not run)




