library(deldir)


### Name: triang.list
### Title: Create a list of Delaunay triangles
### Aliases: triang.list
### Keywords: spatial

### ** Examples

set.seed(42)
x   <- runif(20)
y   <- runif(20)
z   <- sample(1:100,20)
d   <- deldir(x,y,z=z)
ttt <- triang.list(d)



