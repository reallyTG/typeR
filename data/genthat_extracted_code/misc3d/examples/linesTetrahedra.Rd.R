library(misc3d)


### Name: linesTetrahedra
### Title: Create a Set of Lines with Tetrahetra Centered at Points along
###   the Lines
### Aliases: linesTetrahedra
### Keywords: hplot

### ** Examples

p <- pointsTetrahedra(x=c(100,100, 257, 257), 
                      y=c(100,100, 257, 257),
                      z=c(100,257, 257, 100), size=1)
l <- linesTetrahedra(x=matrix(c(100,257,
                                100,257), nrow=2, byrow=TRUE),
                     y=matrix(c(100,257,
                                100,257), nrow=2, byrow=TRUE),
                     z=matrix(c(100,257,
                                257,100), nrow=2, byrow=TRUE),
                     lwd=0.4,
                     col="red")
drawScene.rgl(list(p, l))



