library(Matrix)


### Name: dsyMatrix-class
### Title: Symmetric Dense (Packed | Non-packed) Numeric Matrices
### Aliases: dspMatrix-class dsyMatrix-class
###   coerce,dspMatrix,dsyMatrix-method coerce,dspMatrix,lspMatrix-method
###   coerce,dspMatrix,matrix-method coerce,dspMatrix,CsparseMatrix-method
###   coerce,dspMatrix,sparseMatrix-method
###   coerce,dgeMatrix,dspMatrix-method coerce,matrix,dspMatrix-method
###   coerce,dgeMatrix,dsyMatrix-method coerce,dsyMatrix,corMatrix-method
###   coerce,dsyMatrix,dpoMatrix-method coerce,dsyMatrix,dspMatrix-method
###   coerce,dsyMatrix,lsyMatrix-method .dsy2mat
###   coerce,dsyMatrix,matrix-method coerce,matrix,dsyMatrix-method
###   diag,dspMatrix-method diag,dsyMatrix-method diag<-,dspMatrix-method
###   diag<-,dsyMatrix-method show,dsyMatrix-method
###   norm,dspMatrix,character-method norm,dspMatrix,missing-method
###   norm,dsyMatrix,character-method norm,dsyMatrix,missing-method
###   rcond,dspMatrix,character-method rcond,dspMatrix,missing-method
###   rcond,dsyMatrix,character-method rcond,dsyMatrix,missing-method
###   t,dspMatrix-method t,dsyMatrix-method
### Keywords: classes

### ** Examples

## Only upper triangular part matters (when uplo == "U" as per default)
(sy2 <- new("dsyMatrix", Dim = as.integer(c(2,2)), x = c(14, NA,32,77)))
str(t(sy2)) # uplo = "L", and the lower tri. (i.e. NA is replaced).

chol(sy2) #-> "Cholesky" matrix
(sp2 <- pack(sy2)) # a "dspMatrix"

## Coercing to dpoMatrix gives invalid object:
sy3 <- new("dsyMatrix", Dim = as.integer(c(2,2)), x = c(14, -1, 2, -7))
try(as(sy3, "dpoMatrix")) # -> error: not positive definite
## Don't show: 
tr <- try(as(sy3, "dpoMatrix"), silent=TRUE)
stopifnot(1 == grep("not a positive definite matrix",
                    as.character(tr)),
	  is(sp2, "dspMatrix"))
## End(Don't show)



