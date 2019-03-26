library(dendextend)


### Name: min_depth
### Title: Find minimum/maximum depth of a dendrogram
### Aliases: min_depth max_depth

### ** Examples


hc <- hclust(dist(USArrests), "ave")
(dend1 <- as.dendrogram(hc)) # "print()" method
is.list(dend1)
is.list(dend1[[1]][[1]][[1]])
dend1[[1]][[1]][[1]]
plot(dend1)
min_depth(dend1)
max_depth(dend1)




