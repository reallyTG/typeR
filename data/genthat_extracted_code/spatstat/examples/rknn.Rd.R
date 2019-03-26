library(spatstat)


### Name: rknn
### Title: Theoretical Distribution of Nearest Neighbour Distance
### Aliases: dknn pknn qknn rknn
### Keywords: spatial distribution

### ** Examples

  x <- seq(0, 5, length=20)
  densities <- dknn(x, k=3, d=2)
  cdfvalues <- pknn(x, k=3, d=2)
  randomvalues <- rknn(100, k=3, d=2)
  deciles <- qknn((1:9)/10, k=3, d=2)



