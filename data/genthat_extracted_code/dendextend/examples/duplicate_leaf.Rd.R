library(dendextend)


### Name: duplicate_leaf
### Title: Duplicate a leaf X times
### Aliases: duplicate_leaf

### ** Examples


## Not run: 
##D # define dendrogram object to play with:
##D dend <- USArrests[1:3,] %>% dist %>% hclust(method = "ave") %>% as.dendrogram
##D plot(dend)
##D duplicate_leaf(dend, "Alaska", 3)
##D duplicate_leaf(dend, "Arizona", 2, fix_members =FALSE, fix_order = FALSE)
##D plot(duplicate_leaf(dend, "Alaska", 2))
##D plot(duplicate_leaf(dend, "Alaska", 4))
##D plot(duplicate_leaf(dend, "Arizona", 2))
##D plot(duplicate_leaf(dend, "Arizona", 4))
## End(Not run)




