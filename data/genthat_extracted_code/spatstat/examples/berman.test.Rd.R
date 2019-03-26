library(spatstat)


### Name: berman.test
### Title: Berman's Tests for Point Process Model
### Aliases: berman.test berman.test.ppm berman.test.ppp berman.test.lppm
###   berman.test.lpp
### Keywords: htest spatial

### ** Examples

   # Berman's data
   data(copper)
   X <- copper$SouthPoints
   L <- copper$SouthLines
   D <- distmap(L, eps=1)
   # test of CSR
   berman.test(X, D)
   berman.test(X, D, "Z2")



