library(fda)


### Name: bifd
### Title: Create a bivariate functional data object
### Aliases: bifd
### Keywords: attribute

### ** Examples

Bspl2 <- create.bspline.basis(nbasis=2, norder=1)
Bspl3 <- create.bspline.basis(nbasis=3, norder=2)

(bBspl2.3 <- bifd(array(1:6, dim=2:3), Bspl2, Bspl3))
str(bBspl2.3)




