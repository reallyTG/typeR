library(fpc)


### Name: discrcoord
### Title: Discriminant coordinates/canonical variates
### Aliases: discrcoord
### Keywords: multivariate classif

### ** Examples

  set.seed(4634)
  face <- rFace(600,dMoNo=2,dNoEy=0)
  grface <- as.integer(attr(face,"grouping"))
  dcf <- discrcoord(face,grface)
  plot(dcf$proj,col=grface)
  # ...done in one step by function plotcluster.



