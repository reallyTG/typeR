library(dendextend)


### Name: identify.dendrogram
### Title: Identify Clusters in a Dendrogram (not hclust)
### Aliases: identify.dendrogram

### ** Examples


## Not run: 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D hc <- iris[ss,-5] %>% dist %>% hclust
##D dend <- hc %>% as.dendrogram
##D 
##D plot(dend)
##D identify(dend)
##D 
##D plot(dend, horiz = TRUE)
##D identify(dend, horiz = TRUE)
##D 
## End(Not run)



