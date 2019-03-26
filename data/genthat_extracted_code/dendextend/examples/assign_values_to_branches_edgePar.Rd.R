library(dendextend)


### Name: assign_values_to_branches_edgePar
### Title: Assign values to edgePar of dendrogram's branches
### Aliases: assign_values_to_branches_edgePar

### ** Examples


# This failed before - now it works fine. (thanks to Martin Maechler)
dend <- 1:2 %>% dist %>% hclust %>% as.dendrogram
dend %>% set("branches_lty", 1:2) %>%
   set("branches_col", c("topbranch_never_plots", "black", "orange")) %>% 
   plot


## Not run: 
##D 
##D dend <- USArrests[1:5,] %>% dist %>% hclust %>% as.dendrogram
##D plot(dend)
##D dend <- assign_values_to_branches_edgePar(dend=dend, value = 2, edgePar = "lwd")
##D plot(dend)
##D dend <- assign_values_to_branches_edgePar(dend=dend, value = 2, edgePar = "col")
##D plot(dend)
##D dend <- assign_values_to_branches_edgePar(dend=dend, value = "orange", edgePar = "col")
##D plot(dend)
##D dend2 <- assign_values_to_branches_edgePar(dend=dend, value = 2, edgePar = "lty")
##D plot(dend2)
##D 
##D dend2 %>% unclass %>% str
##D 
##D 
##D 
##D 
## End(Not run)





