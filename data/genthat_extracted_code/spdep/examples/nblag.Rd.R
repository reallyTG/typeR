library(spdep)


### Name: nblag
### Title: Higher order neighbours lists
### Aliases: nblag nblag_cumul
### Keywords: spatial

### ** Examples

if (require(rgdal, quietly=TRUE)) {
example(columbus, package="spData")
coords <- coordinates(columbus)
summary(col.gal.nb, coords)
plot(columbus, border="grey")
plot(col.gal.nb, coords, add=TRUE)
title(main="GAL order 1 (black) and 2 (red) links")
col.lags <- nblag(col.gal.nb, 2)
lapply(col.lags, print)
summary(col.lags[[2]], coords)
plot(col.lags[[2]], coords, add=TRUE, col="red", lty=2)
cuml <- nblag_cumul(col.lags)
cuml
if (require(igraph)) {
W <- as(nb2listw(col.gal.nb), "CsparseMatrix")
G <- graph.adjacency(W, mode="directed", weight="W")
D <- diameter(G)
nbs <- nblag(col.gal.nb, maxlag=D)
n <- length(col.gal.nb)
lmat <- lapply(nbs, nb2mat, style="B", zero.policy=TRUE)
mat <- matrix(0, n, n)
for (i in seq(along=lmat)) mat = mat + i*lmat[[i]]
G2 <- shortest.paths(G)
print(all.equal(G2, mat, check.attributes=FALSE))

}
}



