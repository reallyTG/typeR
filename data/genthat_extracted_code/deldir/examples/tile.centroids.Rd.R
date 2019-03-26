library(deldir)


### Name: tile.centroids
### Title: Compute centroids of Dirchlet (Voronoi) tiles
### Aliases: tile.centroids
### Keywords: spatial

### ** Examples

set.seed(42)
x <- runif(20)
y <- runif(20)
d <- deldir(x,y)
l <- tile.list(d)
g <- tile.centroids(l)
## Not run: 
##D plot(l,close=TRUE)
##D points(g,pch=20,col="red")
## End(Not run)



