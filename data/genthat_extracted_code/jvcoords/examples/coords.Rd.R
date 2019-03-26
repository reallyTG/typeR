library(jvcoords)


### Name: coords
### Title: An S3 class to represent affine coordinate transforms
### Aliases: coords appendTrfm fromCoords toCoords

### ** Examples

  pc <- PCA(iris[, 1:4], n.comp = 3)
  toCoords(pc, c(5, 3, 4, 1))
  fromCoords(pc, c(1, 0, 0))



