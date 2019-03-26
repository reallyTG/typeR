library(dendextend)


### Name: dist.dendlist
### Title: Topological Distances Between Two dendrograms
### Aliases: dist.dendlist

### ** Examples


x <- 1:5 %>% dist %>% hclust %>% as.dendrogram
y <- set(x, "labels", 5:1)

dist.dendlist(dendlist(x1 = x,x2 = x,y1 = y))
dend_diff(x,y)




