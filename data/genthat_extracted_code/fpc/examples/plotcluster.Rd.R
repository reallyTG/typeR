library(fpc)


### Name: plotcluster
### Title: Discriminant projection plot.
### Aliases: plotcluster
### Keywords: multivariate classif

### ** Examples

set.seed(4634)
face <- rFace(300,dMoNo=2,dNoEy=0)
grface <- as.integer(attr(face,"grouping"))
plotcluster(face,grface)
plotcluster(face,grface==1)
plotcluster(face,grface, clnum=1, method="vbc")



