library(fpc)


### Name: ancoord
### Title: Asymmetric neighborhood based discriminant coordinates
### Aliases: ancoord
### Keywords: multivariate classif

### ** Examples

  set.seed(4634)
  face <- rFace(600,dMoNo=2,dNoEy=0)
  grface <- as.integer(attr(face,"grouping"))
  ancf2 <- ancoord(face,grface==4)
  plot(ancf2$proj,col=1+(grface==4))
  # ...done in one step by function plotcluster.



