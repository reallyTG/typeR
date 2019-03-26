library(dendextend)


### Name: rotate
### Title: Rotate a tree object
### Aliases: rotate rotate.default rotate.dendrogram rotate.hclust
###   rotate.phylo sort.dendrogram sort.hclust sort.dendlist rev.hclust

### ** Examples

hc <- hclust(dist(USArrests[c(1,6,13,20, 23),]), "ave")
dend <- as.dendrogram(hc)

# For dendrogram objects:
labels_colors(dend) <- rainbow(nleaves(dend)) 
# let's color the labels to make the followup of the rotation easier
par(mfrow = c(1,2))
plot(dend, main = "Original tree") 
plot(rotate(dend, c(2:5,1)), main = 
"Rotates the left most leaf \n into the right side of the tree")
par(mfrow = c(1,2))
plot(dend, main = "Original tree") 
plot(sort(dend), main = "Sorts the labels by alphabetical order \n 
and rotates the tree to give the best fit possible")
par(mfrow = c(1,2))
plot(dend, main = "Original tree") 
plot(rev(dend), main = "Reverses the order of the tree labels")

# For hclust objects:
plot(hc) 
plot(rotate(hc, c(2:5,1)), main = "Rotates the left most leaf \n 
into the right side of the tree")

par(mfrow = c(1,3))
dend %>% plot(main = "Original tree") 
dend %>% sort %>% plot(main = "labels sort") 
dend %>% sort(type = "nodes") %>% plot(main = "nodes (ladderize) sort") 




