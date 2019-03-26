library(deldir)


### Name: triMat
### Title: Produce matrix of triangle vertex indices.
### Aliases: triMat
### Keywords: spatial

### ** Examples

# These are the data used by Jay Call to illustrate the bug
# that appeared in a previous incarnation of triMat.
xy <- data.frame(
          x = c(0.048,0.412,0.174,0.472,0.607,0.565,0.005,0.237,0.810,0.023),
          y = c(0.512,0.928,0.955,0.739,0.946,0.134,0.468,0.965,0.631,0.782)
      )
dxy <- deldir(xy)
M   <- triMat(dxy)
plot(dxy,wlines="triang",num=TRUE,axes=FALSE,col=c(1,1,1,1,2))
# The triangle with vertices {4,5,8} was listed in the output of
# the previous (buggy) version of triMat().  It is NOT a Delaunay
# triangle and hence should NOT be listed.



