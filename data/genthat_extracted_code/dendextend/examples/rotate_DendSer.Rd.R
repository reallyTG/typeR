library(dendextend)


### Name: rotate_DendSer
### Title: Rotates dend based on DendSer
### Aliases: rotate_DendSer

### ** Examples

## Not run: 
##D library(DendSer) # already used from within the function
##D dend <- USArrests[1:4,] %>% dist %>% hclust("ave") %>% as.dendrogram
##D DendSer.dendrogram(dend)
##D 
##D tanglegram(dend, rotate_DendSer(dend))
##D 
## End(Not run)



