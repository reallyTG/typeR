library(dendextend)


### Name: common_subtrees_clusters
### Title: Find clusters of common subtrees
### Aliases: common_subtrees_clusters

### ** Examples



library(dendextend)
dend1 <- 1:6 %>% dist %>% hclust %>% as.dendrogram
dend2 <- dend1 %>% set("labels", c(1:4,6:5))
tanglegram(dend1, dend2)

clusters1 <- common_subtrees_clusters(dend1, dend2)
dend1_2 <- color_branches(dend1, clusters = clusters1)
plot(dend1_2)
plot(dend1_2, horiz = TRUE)
tanglegram(dend1_2, dend2, highlight_distinct_edges = FALSE)
tanglegram(dend1_2, dend2)




