library(dendextend)


### Name: rank_order.dendrogram
### Title: Fix rank of leaves order values in a dendrogram
### Aliases: rank_order.dendrogram

### ** Examples


# define dendrogram object to play with:
dend <- USArrests[1:4,] %>% dist %>% hclust(method = "ave") %>% as.dendrogram
# plot(dend)
order.dendrogram(dend)
dend2 <- prune(dend, "Alaska")
order.dendrogram(dend2)
order.dendrogram(rank_order.dendrogram(dend2))




