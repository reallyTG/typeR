library(lmreg)


### Name: is.included
### Title: Whether one column space is contained in another
### Aliases: is.included
### Keywords: algebra array

### ** Examples

A <- cbind(c(2,1,-2),c(3,1,-1))
I <- diag(1,3)
is.included(A, I, tol1=sqrt(.Machine$double.eps), tol2=1e-15)
is.included(I, A, tol1=1e-14, tol2=sqrt(.Machine$double.eps))
is.included(proj(A), A, tol1=1e-15, tol2=1e-14)
is.included(A, proj(A))



