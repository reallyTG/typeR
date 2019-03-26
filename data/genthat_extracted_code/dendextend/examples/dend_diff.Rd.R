library(dendextend)


### Name: dend_diff
### Title: Plots two trees side by side, highlighting edges unique to each
###   tree in red.
### Aliases: dend_diff dend_diff.dendrogram dend_diff.dendlist

### ** Examples


x <- 1:5 %>% dist %>% hclust %>% as.dendrogram
y <- set(x, "labels", 5:1)

dend_diff(x, y)
dend_diff(dendlist(x, y))
dend_diff(dendlist(y, x))

dend1 <- 1:10 %>% dist %>% hclust %>% as.dendrogram
dend2 <- dend1 %>% set("labels", c(1,3,2,4, 5:10) )
dend_diff(dend1, dend2)




