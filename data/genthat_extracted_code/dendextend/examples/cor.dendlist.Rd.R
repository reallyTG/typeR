library(dendextend)


### Name: cor.dendlist
### Title: Correlation matrix between a list of trees.
### Aliases: cor.dendlist

### ** Examples


## Not run: 
##D 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("single") %>% as.dendrogram
##D dend3 <- iris[ss,-5] %>% dist %>% hclust("ave") %>% as.dendrogram
##D dend4 <- iris[ss,-5] %>% dist %>% hclust("centroid") %>% as.dendrogram
##D #    cutree(dend1)   
##D cors <- cor.dendlist(dendlist(d1 = dend1, d2 = dend2, d3 = dend3, d4 = dend4))
##D 
##D cors
##D 
##D # a nice plot for them:
##D library(corrplot)
##D corrplot(cor.dendlist(dend1234), "pie", "lower")
##D 
## End(Not run)



