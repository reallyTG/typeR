library(dendextend)


### Name: order.hclust
### Title: Ordering of the Leaves in a hclust Dendrogram
### Aliases: order.hclust

### ** Examples


set.seed(23235)
ss <- sample(1:150, 10 )
hc <- iris[ss,-5] %>% dist %>% hclust
# dend <- hc %>% as.dendrogram
order.hclust(hc)




