library(spdep)


### Name: Graph Components
### Title: Depth First Search on Neighbor Lists
### Aliases: n.comp.nb
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
plot(col.gal.nb, coords, col="grey")
col2 <- droplinks(col.gal.nb, 21)
plot(col2, coords, add=TRUE)
res <- n.comp.nb(col2)
table(res$comp.id)
points(coords, col=res$comp.id, pch=16)
if (require(igraph)) {
B <- as(nb2listw(col2, style="B", zero.policy=TRUE), "CsparseMatrix")
g1 <- graph.adjacency(B, mode="undirected")
c1 <- clusters(g1)
print(c1$no == res$nc)
print(all.equal(c1$membership, res$comp.id))
print(all.equal(c1$csize, c(table(res$comp.id)), check.attributes=FALSE))
W <- as(nb2listw(col2, style="W", zero.policy=TRUE), "CsparseMatrix")
g1W <- graph.adjacency(W, mode="directed", weighted="W")
c1W <- clusters(g1W)
print(all.equal(c1W$membership, res$comp.id))
B1 <- get.adjacency(g1)
print(all.equal(B, B1))
}
}



