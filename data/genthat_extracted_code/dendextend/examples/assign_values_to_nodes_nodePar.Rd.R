library(dendextend)


### Name: assign_values_to_nodes_nodePar
### Title: Assign values to nodePar of dendrogram's nodes
### Aliases: assign_values_to_nodes_nodePar

### ** Examples


## Not run: 
##D 
##D dend <- USArrests[1:5,] %>% dist %>% hclust("ave") %>% as.dendrogram
##D 
##D # reproduces "labels_colors<-" 
##D # although it does force us to run through the tree twice, 
##D # hence "labels_colors<-" is better...
##D plot(dend)
##D dend2 <- dend %>% 
##D    assign_values_to_nodes_nodePar(value = 19, nodePar = "pch") %>% 
##D    assign_values_to_nodes_nodePar(value = c(1,2), nodePar = "cex")  %>% 
##D    assign_values_to_nodes_nodePar(value = c(2,1), nodePar = "col")
##D plot(dend2)
##D 
##D 
##D ### Making sure this works for NA with character.
##D dend %>% 
##D assign_values_to_nodes_nodePar(value = 19, nodePar = "pch") %>% 
##D assign_values_to_nodes_nodePar(value = c("red", NA), nodePar = "col") -> dend2
##D plot(dend2)
##D 
## End(Not run)




