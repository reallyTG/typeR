library(dendextend)


### Name: remove_leaves_nodePar
### Title: Remove all nodePar values from a dendrogram's leaves
### Aliases: remove_leaves_nodePar

### ** Examples


## Not run: 
##D 
##D dend <- USArrests[1:5,] %>% dist %>% hclust %>% as.dendrogram
##D 
##D dend <- color_labels(dend, 3)
##D par(mfrow = c(1,2))
##D plot(dend)
##D plot(remove_leaves_nodePar(dend))
##D 
##D 
##D get_leaves_attr(dend, "nodePar")
##D get_leaves_attr(remove_leaves_nodePar(dend), "nodePar")
##D 
##D 
## End(Not run)




