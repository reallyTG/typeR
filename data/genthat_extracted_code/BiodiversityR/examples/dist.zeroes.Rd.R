library(BiodiversityR)


### Name: dist.zeroes
### Title: Distance Matrix Transformation
### Aliases: dist.zeroes
### Keywords: multivariate

### ** Examples

library(vegan)
matrix <- array(0,dim=c(5,3))
matrix[4,] <- c(1,2,3)
matrix[5,] <- c(1,0,0)
dist1 <- vegdist(matrix,method="kulc")
dist1
dist2 <- dist.zeroes(matrix,dist1)
dist2



