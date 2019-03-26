library(dendextend)


### Name: nleaves
### Title: Counts the number of leaves in a tree
### Aliases: nleaves nleaves.default nleaves.dendrogram nleaves.dendlist
###   nleaves.hclust nleaves.phylo

### ** Examples

hc <- hclust(dist(USArrests[1:5,]), "ave")
dend <- as.dendrogram(hc)

nleaves(dend) # 5
nleaves(hc) # 5



