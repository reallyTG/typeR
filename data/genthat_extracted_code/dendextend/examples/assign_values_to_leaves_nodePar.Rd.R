library(dendextend)


### Name: assign_values_to_leaves_nodePar
### Title: Assign values to nodePar of dendrogram's leaves
### Aliases: assign_values_to_leaves_nodePar

### ** Examples


## Not run: 
##D 
##D dend <- USArrests[1:5,] %>% dist %>% hclust("ave") %>% as.dendrogram
##D 
##D # reproduces "labels_colors<-" 
##D # although it does force us to run through the tree twice, 
##D # hence "labels_colors<-" is better...
##D plot(dend)
##D dend <- assign_values_to_leaves_nodePar(dend=dend, value = c(3,2), nodePar = "lab.col")
##D plot(dend)
##D 
##D dend <- assign_values_to_leaves_nodePar(dend, 1, "pch")
##D plot(dend)
##D # fix the annoying pch=1:
##D dend <- assign_values_to_leaves_nodePar(dend, NA, "pch")
##D plot(dend)
##D # adjust the cex:
##D dend <- assign_values_to_leaves_nodePar(dend, 19, "pch")
##D dend <- assign_values_to_leaves_nodePar(dend, 2, "lab.cex")
##D plot(dend)
##D 
##D str(unclass(dend))
##D 
##D get_leaves_attr(dend, "nodePar", simplify=FALSE)
##D 
## End(Not run)




