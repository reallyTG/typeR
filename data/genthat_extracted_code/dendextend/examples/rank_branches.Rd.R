library(dendextend)


### Name: rank_branches
### Title: Rank branches' heights
### Aliases: rank_branches

### ** Examples


# define dendrogram object to play with:
dend <- USArrests[1:5,] %>% dist %>% hclust %>% as.dendrogram

par(mfrow = c(1,3))

plot(dend)
plot(rank_branches(dend))
plot(hang.dendrogram(rank_branches(dend)))

 



