library(dendextend)


### Name: distinct_edges
### Title: Finds distinct edges in one tree compared to another
### Aliases: distinct_edges

### ** Examples


x <- 1:5 %>% dist %>% hclust %>% as.dendrogram
y <- set(x, "labels", 5:1)
distinct_edges(x, y)
distinct_edges(y, x)
dend_diff(x, y)
# tanglegram(x, y)




