library(dendextend)


### Name: untangle_DendSer
### Title: Tries to run DendSer on a dendrogram
### Aliases: untangle_DendSer

### ** Examples

## Not run: 
##D set.seed(232)
##D ss <- sample(1:150, 20)
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D dend12 <- dendlist(dend1, dend2)
##D 
##D # bad solutions
##D dend12 %>% tanglegram
##D dend12 %>% untangle("step2") %>% tanglegram
##D dend12 %>% untangle_DendSer %>% tanglegram
##D # but the combination is quite awsome:
##D dend12 %>% untangle_DendSer %>% untangle("step2") %>% tanglegram
## End(Not run)



