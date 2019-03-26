library(epiGWAS)


### Name: merge_cluster
### Title: Merges a number of clusters around the target
### Aliases: merge_cluster

### ** Examples

hc <- hclust(dist(USArrests))
clusters <- cutree(hc, k = 10)
merge_cluster(clusters, center=5, k=2)




