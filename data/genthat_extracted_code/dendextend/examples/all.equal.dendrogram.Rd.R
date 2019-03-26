library(dendextend)


### Name: all.equal.dendrogram
### Title: Global Comparison of two (or more) dendrograms
### Aliases: all.equal.dendrogram all.equal.dendlist

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
##D 
##D all.equal(dend1, dend1)
##D all.equal(dend1, dend2)
##D all.equal(dend1, dend2, use.edge.length = FALSE)
##D all.equal(dend1, dend2, use.edge.length = FALSE, use.topology = FALSE)
##D 
##D all.equal(dend2, dend4, use.edge.length = TRUE)
##D all.equal(dend2, dend4, use.edge.length = FALSE)
##D 
##D all.equal(dendlist(dend1, dend2, dend3, dend4))
##D all.equal(dendlist(dend1, dend2, dend3, dend4), use.edge.length = FALSE)
##D all.equal(dendlist(dend1, dend1, dend1))
##D 
## End(Not run)



