library(dendextend)


### Name: dendlist
### Title: Creating a dendlist object from several dendrograms
### Aliases: dendlist plot.dendlist

### ** Examples


## Not run: 
##D 
##D dend <- iris[,-5] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- iris[,-5] %>% dist %>% hclust(method = "single") %>% as.dendrogram
##D dendlist(1:4, 5, a=dend) # Error
##D # dendlist <- function (...) list(...)
##D dendlist(dend)
##D dendlist(dend, dend)
##D dendlist(dend, dend, dendlist(dend))
##D #  notice how the order of 
##D dendlist(dend, dend2)
##D dendlist(dend) %>% dendlist(dend2)
##D dendlist(dend) %>% dendlist(dend2) %>% dendlist(dend)
##D dendlist(dend, dend2) %>% tanglegram
##D tanglegram(tree1 = dendlist(dend, dend2))
##D 
##D dend <- iris[1:20, -5] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- iris[1:20, -5] %>% dist %>% hclust(method = "single") %>% as.dendrogram
##D 
##D x <- dendlist(dend, dend2)
##D plot(x)
##D 
## End(Not run)




