library(dendextend)


### Name: sample.dendrogram
### Title: Sample a tree
### Aliases: sample.dendrogram

### ** Examples


## Not run: 
##D # define dendrogram object to play with:
##D dend <- USArrests[1:5,] %>% dist %>% hclust(method = "ave") %>% as.dendrogram
##D plot(dend)
##D 
##D # # same tree, with different order of labels 
##D plot(sample.dendrogram(dend, replace = FALSE)) 
##D 
##D # # A different tree (!), with some labels duplicated, 
##D   # while others are pruned
##D plot(sample.dendrogram(dend, replace = TRUE)) 
## End(Not run)




