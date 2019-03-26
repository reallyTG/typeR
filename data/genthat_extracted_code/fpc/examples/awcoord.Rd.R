library(fpc)


### Name: awcoord
### Title: Asymmetric weighted discriminant coordinates
### Aliases: awcoord
### Keywords: multivariate classif

### ** Examples

  set.seed(4634)
  face <- rFace(600,dMoNo=2,dNoEy=0)
  grface <- as.integer(attr(face,"grouping"))
  awcf <- awcoord(face,grface==1)
  # awcf2 <- ancoord(face,grface==1, method="mcd")
  plot(awcf$proj,col=1+(grface==1))
  # plot(awcf2$proj,col=1+(grface==1))
  # ...done in one step by function plotcluster.



