library(dendextend)


### Name: untangle
### Title: untangle dendrograms
### Aliases: untangle untangle.default untangle_labels untangle.dendrogram
###   untangle.dendlist

### ** Examples

## Not run: 
##D set.seed(23235)
##D ss <- sample(1:150, 10 )
##D dend1 <- iris[ss,-5] %>% dist %>% hclust("com") %>% as.dendrogram
##D dend2 <- iris[ss,-5] %>% dist %>% hclust("sin") %>% as.dendrogram
##D dend12 <- dendlist(dend1, dend2)
##D 
##D dend12 %>% tanglegram
##D 
##D untangle(dend1, dend2, method="random", R = 5) %>% tanglegram
##D 
##D # it works, and we get something different:
##D set.seed(1234)
##D dend12 %>% untangle(method="random", R = 5) %>% tanglegram
##D 
##D set.seed(1234)
##D # fixes it completely:
##D dend12 %>% untangle(method="random", R = 5) %>% untangle(method="step1") %>% tanglegram
##D # not good enough
##D dend12 %>% untangle(method="step1") %>% tanglegram
##D # not good enough
##D dend12 %>% untangle(method="step2") %>% tanglegram
##D # How we might wish to use it:
##D set.seed(12777)
##D dend12 %>% 
##D    untangle(method="random", R = 1) %>%
##D    untangle(method="step2") %>% 
##D    tanglegram
##D 
## End(Not run)



