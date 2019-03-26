library(BayesX)


### Name: createxymap
### Title: Create map objects for some points and a given distance
### Aliases: createxymap
### Keywords: spatial

### ** Examples

x <- c(3,3,5,9.5,11,11)
y <- c(2,4,4,6,4.5,5)
xymap <- createxymap(x, y, districts=c("A","B","C","D","E","F"), max.dist=2)
xymap$gra
drawmap(map=xymap$bnd)



