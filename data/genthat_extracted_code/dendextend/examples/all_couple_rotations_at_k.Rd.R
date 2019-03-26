library(dendextend)


### Name: all_couple_rotations_at_k
### Title: Rotate tree branches for k
### Aliases: all_couple_rotations_at_k

### ** Examples


## Not run: 
##D dend1 <- USArrests[1:5,] %>% dist %>% hclust %>% as.dendrogram
##D dend2 <- all_couple_rotations_at_k(dend1, k=2)[[2]]
##D tanglegram(dend1,dend2)
##D entanglement(dend1,dend2, L = 2) # 0.5
##D 
##D dend2 <- all_couple_rotations_at_k(dend1, k=3)[[2]]
##D tanglegram(dend1,dend2)
##D entanglement(dend1,dend2, L = 2) # 0.4
##D 
##D dend2 <- all_couple_rotations_at_k(dend1, k=4)[[2]]
##D tanglegram(dend1,dend2)
##D entanglement(dend1,dend2, L = 2) # 0.05
## End(Not run)



