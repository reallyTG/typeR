library(dendextend)


### Name: assign_values_to_leaves_edgePar
### Title: Assign values to edgePar of dendrogram's leaves
### Aliases: assign_values_to_leaves_edgePar

### ** Examples


## Not run: 
##D 
##D dend <- USArrests[1:5,] %>% dist %>% hclust("ave") %>% as.dendrogram
##D 
##D plot(dend)
##D dend <- assign_values_to_leaves_edgePar(dend=dend, value = c(3,2), edgePar = "col")
##D plot(dend)
##D dend <- assign_values_to_leaves_edgePar(dend=dend, value = c(3,2), edgePar = "lwd")
##D plot(dend)
##D dend <- assign_values_to_leaves_edgePar(dend=dend, value = c(3,2), edgePar = "lty")
##D plot(dend)
##D 
##D get_leaves_attr(dend, "edgePar", simplify=FALSE)
##D 
## End(Not run)




