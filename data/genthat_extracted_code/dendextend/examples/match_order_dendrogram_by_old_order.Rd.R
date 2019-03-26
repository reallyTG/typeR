library(dendextend)


### Name: match_order_dendrogram_by_old_order
### Title: Adjust the order of one dendrogram based on another (using
###   order)
### Aliases: match_order_dendrogram_by_old_order

### ** Examples

## Not run: 
##D 
##D dend <- USArrests[1:4,] %>% dist %>% hclust %>% as.dendrogram
##D order.dendrogram(dend) #  c(4L, 3L, 1L, 2L)
##D 
##D 
##D # Watch this!
##D dend_changed <- dend
##D dend_changed <- rev(dend_changed)
##D expect_false(identical(order.dendrogram(dend_changed), order.dendrogram(dend)))
##D # we keep the order of dend_change, so that the leaves order are synced
##D # with their labels JUST LIKE dend:
##D old_dend_changed_order <- order.dendrogram(dend_changed)   
##D # now we change dend_changed leaves order values:
##D order.dendrogram(dend_changed) <- 1:4
##D # and we can fix them again, based on their old kept leaves order:
##D dend_changed <- match_order_dendrogram_by_old_order(dend_changed, dend, 
##D                                                      old_dend_changed_order)
##D expect_identical(order.dendrogram(dend_changed), order.dendrogram(dend))
##D 
##D 
## End(Not run)



