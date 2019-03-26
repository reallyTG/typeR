library(deldir)


### Name: plot.triang.list
### Title: Plot Delaunay triangles
### Aliases: plot.triang.list
### Keywords: spatial

### ** Examples

set.seed(42)
x <- runif(20)
y <- runif(20)
d <- deldir(x,y)
ttt <- triang.list(d)
plot(ttt,border="red",showrect=TRUE)
sss <- tile.list(d)
plot(sss)
plot(ttt,add=TRUE,border="blue")



