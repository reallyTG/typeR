library(dendextend)


### Name: shuffle
### Title: Random rotation of trees
### Aliases: shuffle shuffle.default shuffle.dendrogram shuffle.dendlist
###   shuffle.hclust shuffle.phylo

### ** Examples

dend <- USArrests %>% dist %>% hclust %>% as.dendrogram
set.seed(234238)
dend2 <- shuffle(dend)

tanglegram(dend, dend2, margin_inner=7)
entanglement(dend, dend2) # 0.3983

# although these ARE the SAME tree:
tanglegram(sort(dend), sort(dend2), margin_inner=7)





