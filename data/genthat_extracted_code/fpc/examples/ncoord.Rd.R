library(fpc)


### Name: ncoord
### Title: Neighborhood based discriminant coordinates
### Aliases: ncoord
### Keywords: multivariate classif

### ** Examples

  set.seed(4634)
  face <- rFace(600,dMoNo=2,dNoEy=0)
  grface <- as.integer(attr(face,"grouping"))
  ncf <- ncoord(face,grface)
  plot(ncf$proj,col=grface)
  ncf2 <- ncoord(face,grface,weighted=TRUE)
  plot(ncf2$proj,col=grface)
  # ...done in one step by function plotcluster.



