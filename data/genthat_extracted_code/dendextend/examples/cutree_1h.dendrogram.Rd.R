library(dendextend)


### Name: cutree_1h.dendrogram
### Title: cutree for dendrogram (by 1 height only!)
### Aliases: cutree_1h.dendrogram

### ** Examples

hc <- hclust(dist(USArrests[c(1,6,13,20, 23),]), "ave")
dend <- as.dendrogram(hc)
cutree(hc, h=50) # on hclust
cutree_1h.dendrogram(dend, h=50) # on a dendrogram

labels(dend)

# the default (ordered by original data's order)
cutree_1h.dendrogram(dend, h=50, order_clusters_as_data = TRUE) 

# A different order of labels - order by their order in the tree
cutree_1h.dendrogram(dend, h=50, order_clusters_as_data = FALSE) 


# make it faster
## Not run: 
##D library(microbenchmark)
##D microbenchmark(
##D          cutree_1h.dendrogram(dend, h=50),
##D          cutree_1h.dendrogram(dend, h=50,use_labels_not_values = FALSE)
##D          )
##D          # 0.8 vs 0.6 sec - for 100 runs
## End(Not run)





