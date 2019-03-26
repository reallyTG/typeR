library(dendextend)


### Name: cutree_1k.dendrogram
### Title: cutree for dendrogram (by 1 k value only!)
### Aliases: cutree_1k.dendrogram

### ** Examples

hc <- hclust(dist(USArrests[c(1,6,13,20, 23),]), "ave")
dend <- as.dendrogram(hc)
cutree(hc, k=3) # on hclust
cutree_1k.dendrogram(dend, k=3) # on a dendrogram

labels(dend)

# the default (ordered by original data's order)
cutree_1k.dendrogram(dend, k=3, order_clusters_as_data = TRUE) 

# A different order of labels - order by their order in the tree
cutree_1k.dendrogram(dend, k=3, order_clusters_as_data = FALSE) 


# make it faster
## Not run: 
##D library(microbenchmark)
##D dend_ks <- heights_per_k.dendrogram
##D microbenchmark(
##D          cutree_1k.dendrogram = cutree_1k.dendrogram(dend, k=4),
##D          cutree_1k.dendrogram_no_labels = cutree_1k.dendrogram(dend, 
##D                                        k=4,use_labels_not_values = FALSE),
##D          cutree_1k.dendrogram_no_labels_per_k = cutree_1k.dendrogram(dend, 
##D                                        k=4, use_labels_not_values = FALSE,
##D                                              dend_heights_per_k = dend_ks)
##D          )
##D          # the last one is the fastest...
## End(Not run)





