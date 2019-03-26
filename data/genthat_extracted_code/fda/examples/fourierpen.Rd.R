library(fda)


### Name: fourierpen
### Title: Fourier Penalty Matrix
### Aliases: fourierpen
### Keywords: smooth

### ** Examples


#  set up a Fourier basis with 13 basis functions
#  and and period 1.0.
basisobj <- create.fourier.basis(c(0,1),13)
#  compute the 13 by 13 matrix of inner products
#  of second derivatives
penmat <- fourierpen(basisobj)




