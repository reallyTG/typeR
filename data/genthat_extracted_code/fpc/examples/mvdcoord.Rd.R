library(fpc)


### Name: mvdcoord
### Title: Mean/variance differences discriminant coordinates
### Aliases: mvdcoord
### Keywords: multivariate classif

### ** Examples

  set.seed(4634)
  face <- rFace(300,dMoNo=2,dNoEy=0,p=3)
  grface <- as.integer(attr(face,"grouping"))
  mcf <- mvdcoord(face,grface)
  plot(mcf$proj,col=grface)
  # ...done in one step by function plotcluster.



