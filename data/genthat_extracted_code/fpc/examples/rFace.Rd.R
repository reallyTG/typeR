library(fpc)


### Name: rFace
### Title: "Face-shaped" clustered benchmark datasets
### Aliases: rFace
### Keywords: data

### ** Examples

  set.seed(4634)
  face <- rFace(600,dMoNo=2,dNoEy=0)
  grface <- as.integer(attr(face,"grouping"))
  plot(face, col = grface)
#  pairs(face, col = grface, main ="rFace(600,dMoNo=2,dNoEy=0)")



