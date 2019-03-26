library(dendextend)


### Name: as.dendlist
### Title: Try to coerce something into a dendlist
### Aliases: as.dendlist

### ** Examples


## Not run: 
##D 
##D dend <- iris[,-5] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- iris[,-5] %>% dist %>% hclust(method = "single") %>% as.dendrogram
##D 
##D x = list(dend, 1, dend2)
##D as.dendlist(x)
##D 
## End(Not run)




