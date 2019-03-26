library(dendextend)


### Name: ladderize
### Title: Ladderize a Tree
### Aliases: ladderize ladderize.dendrogram ladderize.phylo
###   ladderize.dendlist

### ** Examples


dend <- USArrests[1:8,] %>% dist %>% hclust %>% as.dendrogram %>% 
   set("labels_colors") %>% set("branches_k_color", k = 5)
set.seed(123)
dend <- shuffle(dend)

par(mfrow = c(1,3))
dend %>% plot(main = "Original")
dend %>% ladderize(TRUE) %>% plot(main = "Right (default)")
dend %>% ladderize(FALSE) %>% plot(main = "Left (rev of right)")




