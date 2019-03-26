library(dendextend)


### Name: highlight_distinct_edges
### Title: Highlight distint edges in a tree (compared to another one)
### Aliases: highlight_distinct_edges highlight_distinct_edges.dendrogram
###   highlight_distinct_edges.dendlist

### ** Examples


x <- 1:5 %>% dist %>% hclust %>% as.dendrogram
y <- set(x, "labels", 5:1)
distinct_edges(x, y)
distinct_edges(y, x)

par(mfrow = c(1,2))
plot(highlight_distinct_edges(x, y))
plot(y)

# tanglegram(highlight_distinct_edges(x, y),y)
# dend_diff(x, y)

## Not run: 
##D 
##D # using  highlight_distinct_edges combined with dendlist and set
##D # to clearly highlight "stable" branches.
##D data(iris); ss <- c(1:5, 51:55, 101:105)
##D iris1 <-iris[ss,-5] %>% dist %>% hclust(method = "single") %>% as.dendrogram 
##D iris2 <- iris[ss,-5] %>% dist %>% hclust(method = "complete") %>% as.dendrogram
##D iris12 <- dendlist(iris1, iris2) %>% set("branches_k_color",k=3) %>% 
##D    set("branches_lwd", 3) %>%  highlight_distinct_edges(value = 1, edgePar = "lwd")
##D iris12 %>% untangle(method = "step2side")  %>% 
##D tanglegram(sub="Iris dataset", main_left = "'single' clustering", 
##D 				main_right = "'complete' clustering")
## End(Not run)




