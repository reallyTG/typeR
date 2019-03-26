library(dendextend)


### Name: reindex_dend
### Title: Reindexing a pruned dendrogram
### Aliases: reindex_dend

### ** Examples

hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

dend_pruned <- prune(dend , c("Alaska", "California"), reindex_dend = FALSE )

## A leave have an index larger than the number of leaves:
unlist (dend_pruned)
# [1] 4 3 1
#' 
dend_pruned_reindexed <- reindex_dend (dend_pruned)

## All leaf indices are no larger than the number of leaves:
unlist (dend_pruned_reindexed)
# [1] 3 2 1

## The dendrograms are equal:
all.equal (dend_pruned, dend_pruned_reindexed)
# TRUE





