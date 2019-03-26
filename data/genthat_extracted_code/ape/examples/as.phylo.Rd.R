library(ape)


### Name: as.phylo
### Title: Conversion Among Tree and Network Objects
### Aliases: as.phylo as.phylo.hclust as.phylo.phylog as.hclust.phylo
###   old2new.phylo new2old.phylo as.network.phylo as.igraph
###   as.igraph.phylo
### Keywords: manip

### ** Examples

data(bird.orders)
hc <- as.hclust(bird.orders)
tr <- as.phylo(hc)
all.equal(bird.orders, tr) # TRUE

### shows the three plots for tree objects:
dend <- as.dendrogram(hc)
layout(matrix(c(1:3, 3), 2, 2))
plot(bird.orders, font = 1)
plot(hc)
par(mar = c(8, 0, 0, 0)) # leave space for the labels
plot(dend)

### how to get identical plots with
### plot.phylo and plot.dendrogram:
layout(matrix(1:2, 2, 1))
plot(bird.orders, font = 1, no.margin = TRUE, label.offset = 0.4)
par(mar = c(0, 0, 0, 8))
plot(dend, horiz = TRUE)
layout(1)

## Not run: 
##D ### convert into networks:
##D if (require(network)) {
##D     x <- as.network(rtree(10))
##D     print(x)
##D     plot(x, vertex.cex = 1:4)
##D     plot(x, displaylabels = TRUE)
##D }
##D tr <- rtree(5)
##D if (require(igraph)) {
##D     print((x <- as.igraph(tr)))
##D     plot(x)
##D     print(as.igraph(tr, TRUE, FALSE))
##D     print(as.igraph(tr, FALSE, FALSE))
##D }
## End(Not run)



