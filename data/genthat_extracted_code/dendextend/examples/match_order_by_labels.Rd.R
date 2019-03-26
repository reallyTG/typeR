library(dendextend)


### Name: match_order_by_labels
### Title: Adjust the order of one dendrogram based on another (using
###   labels)
### Aliases: match_order_by_labels

### ** Examples

## Not run: 
##D 
##D dend <- USArrests[1:4,] %>% dist %>% hclust %>% as.dendrogram
##D order.dendrogram(dend) #  c(4L, 3L, 1L, 2L)
##D 
##D dend_changed <- dend
##D order.dendrogram(dend_changed) <- 1:4
##D order.dendrogram(dend_changed) # c(1:4)
##D 
##D # now let's fix the order of the new object to be as it was:
##D dend_changed <- match_order_by_labels(dend_changed, dend)
##D # these two are now the same:
##D order.dendrogram(dend_changed)
##D order.dendrogram(dend))
##D 
## End(Not run)



