library(kknn)


### Name: specClust
### Title: Spectral Clustering
### Aliases: specClust plot.specClust
### Keywords: cluster

### ** Examples

data(iris)
cl <- specClust(iris[,1:4], 3, nn=5)
pcol <- as.character(as.numeric(iris$Species))
pairs(iris[1:4], pch = pcol, col = c("green", "red", "blue")[cl$cluster])
table(iris[,5], cl$cluster)



