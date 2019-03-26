library(dendextend)


### Name: untangle_random_search
### Title: Untangle - random search
### Aliases: untangle_random_search

### ** Examples


## Not run: 
##D dend1 <- iris[,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D tanglegram(dend1,dend2)
##D 
##D set.seed(65168)
##D dend12 <- untangle_random_search(dend1, dend2, R = 10)
##D tanglegram(dend12[[1]],dend12[[2]])
##D tanglegram(dend12)
##D 
##D entanglement(dend1,dend2, L = 2) # 0.8894
##D entanglement(dend12[[1]],dend12[[2]], L = 2) # 0.0998
##D 
##D 
##D 
## End(Not run)



