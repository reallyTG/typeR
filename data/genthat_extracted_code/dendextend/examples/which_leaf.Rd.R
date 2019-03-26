library(dendextend)


### Name: which_leaf
### Title: Which node is a leaf?
### Aliases: which_leaf

### ** Examples

## Not run: 
##D 
##D library(dendextend)
##D 
##D # Getting the dend dend
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D dend <- iris[ss,-5] %>% dist %>% hclust %>% as.dendrogram
##D dend %>% plot
##D 
##D which_leaf(dend)
##D 
## End(Not run)



