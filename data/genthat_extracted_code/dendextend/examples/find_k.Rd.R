library(dendextend)


### Name: find_k
### Title: Find the (estimated) number of clusters for a dendrogram using
###   average silhouette width
### Aliases: find_k plot.find_k

### ** Examples


dend <- iris[,-5] %>% dist %>% hclust %>% as.dendrogram
dend_k <- find_k(dend)
plot(dend_k)
plot(color_branches(dend, k = dend_k$nc))

library(cluster)
sil <- silhouette(dend_k$pamobject)
plot(sil)

dend <- USArrests %>% dist %>% hclust(method = "ave") %>% as.dendrogram
dend_k <- find_k(dend)
plot(dend_k)
plot(color_branches(dend, k = dend_k$nc))




