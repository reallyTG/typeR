library(lmreg)


### Name: intsectbasis
### Title: Basis of intersection of two column spaces
### Aliases: intsectbasis
### Keywords: algebra array

### ** Examples

A<-matrix(2,3,5)
B<-matrix(3,3,2)
intsectbasis(A,B, tol1=sqrt(.Machine$double.eps), tol2=1e-14)



