library(spam)


### Name: lower.tri
### Title: Lower and Upper Triangular Part of a Sparse Matrix
### Aliases: lower.tri upper.tri lower.tri.spam upper.tri.spam
### Keywords: array algebra

### ** Examples

smat <- spam( c( 1,2,0,3,0,0,0,4,5),3)
upper.tri( smat)
upper.tri( smat, diag=TRUE)

options(spam.trivalues=TRUE)
upper.tri( smat)




