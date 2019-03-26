library(dendextend)


### Name: untangle_step_rotate_2side
### Title: Stepwise untangle two trees one at a time
### Aliases: untangle_step_rotate_2side

### ** Examples


## Not run: 
##D dend1 <- USArrests[1:20,] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- USArrests[1:20,] %>% dist %>% hclust(method = "single") %>% as.dendrogram
##D set.seed(3525)
##D dend2 <- shuffle(dend2)
##D tanglegram(dend1,dend2, margin_inner=6.5)
##D entanglement(dend1,dend2, L = 2) # 0.79
##D 
##D dend2_corrected <- untangle_step_rotate_1side(dend2, dend1)
##D tanglegram(dend1,dend2_corrected, margin_inner=6.5) # Good.
##D entanglement(dend1,dend2_corrected, L = 2) # 0.0067
##D # it is better, but not perfect. Can we improve it?
##D 
##D dend12_corrected <- untangle_step_rotate_2side(dend1, dend2)
##D tanglegram(dend12_corrected[[1]],dend12_corrected[[2]], margin_inner=6.5) # Better...
##D entanglement(dend12_corrected[[1]],dend12_corrected[[2]], L=2) # 0.0045
##D 
##D 
##D # best combination:
##D dend12_corrected_1 <- untangle_random_search(dend1, dend2)
##D dend12_corrected_2 <- untangle_step_rotate_2side(dend12_corrected_1[[1]],dend12_corrected_1[[2]])
##D tanglegram(dend12_corrected_2[[1]],dend12_corrected_2[[2]], margin_inner=6.5) # Better...
##D entanglement(dend12_corrected_2[[1]],dend12_corrected_2[[2]], L=2) # 0 - PERFECT.
##D 
## End(Not run)                              



