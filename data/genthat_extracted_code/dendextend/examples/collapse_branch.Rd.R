library(dendextend)


### Name: collapse_branch
### Title: Collapse branches under a tolerance level
### Aliases: collapse_branch

### ** Examples


# # ladderize is like sort(..., type = "node")
dend <- iris[1:5,-5] %>% dist %>% hclust %>% as.dendrogram 
par(mfrow = c(1,3))
dend %>% ladderize %>% plot(horiz = TRUE); abline(v = .2, col = 2, lty = 2)
dend %>% collapse_branch(tol = 0.2) %>% ladderize %>% plot(horiz = TRUE)
dend %>% collapse_branch(tol = 0.2) %>% ladderize %>% 
      hang.dendrogram(hang = 0) %>% plot(horiz = TRUE)

par(mfrow = c(1,2))
dend %>% collapse_branch(tol = 0.2, lower = FALSE) %>% plot(horiz = TRUE, main = "dendrogram")
library(ape)
dend %>% as.phylo %>% di2multi(tol = 0.2) %>% plot(main = "phylo")



