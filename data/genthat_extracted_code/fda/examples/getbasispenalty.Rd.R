library(fda)


### Name: getbasispenalty
### Title: Evaluate a Roughness Penalty Matrix
### Aliases: getbasispenalty
### Keywords: smooth

### ** Examples


#  set up a B-spline basis of order 4 with 13 basis functions
#  and knots at 0.0, 0.1,..., 0.9, 1.0.
basisobj <- create.bspline.basis(c(0,1),13)
#  compute the 13 by 13 matrix of inner products of second derivatives
penmat <- getbasispenalty(basisobj)
#  set up a Fourier basis with 13 basis functions
#  and and period 1.0.
basisobj <- create.fourier.basis(c(0,1),13)
#  compute the 13 by 13 matrix of inner products of second derivatives
penmat <- getbasispenalty(basisobj)




