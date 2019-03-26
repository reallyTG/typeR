library(dendextend)


### Name: untangle_step_rotate_1side
### Title: Stepwise untangle one tree compared to another
### Aliases: untangle_step_rotate_1side

### ** Examples


## Not run: 
##D dend1 <- USArrests[1:10,] %>% dist %>% hclust %>% as.dendrogram
##D set.seed(3525)
##D dend2 <- shuffle(dend1)
##D tanglegram(dend1,dend2)
##D entanglement(dend1,dend2, L = 2) # 0.4727
##D 
##D dend2_corrected <- untangle_step_rotate_1side(dend2, dend1)[[1]]
##D tanglegram(dend1,dend2_corrected) # FIXED.
##D entanglement(dend1,dend2_corrected, L = 2) # 0
##D 
## End(Not run)



