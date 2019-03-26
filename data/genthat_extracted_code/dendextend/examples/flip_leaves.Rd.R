library(dendextend)


### Name: flip_leaves
### Title: Flip leaves
### Aliases: flip_leaves

### ** Examples


## Not run: 
##D dend1 <- USArrests[1:5,] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- flip_leaves(dend1, c(3,5), c(1,2))
##D tanglegram(dend1,dend2)
##D entanglement(dend1,dend2, L = 2) # 0.4
##D 
## End(Not run)



