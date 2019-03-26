library(Matrix)


### Name: lsyMatrix-class
### Title: Symmetric Dense Logical Matrices
### Aliases: lspMatrix-class lsyMatrix-class
###   coerce,lspMatrix,dspMatrix-method coerce,lspMatrix,lsyMatrix-method
###   coerce,lspMatrix,lgeMatrix-method coerce,lsyMatrix,dsyMatrix-method
###   coerce,lsyMatrix,lgeMatrix-method coerce,lsyMatrix,lspMatrix-method
###   coerce,matrix,lsyMatrix-method coerce,matrix,lspMatrix-method
###   diag,lspMatrix-method diag,lsyMatrix-method diag<-,lspMatrix-method
###   diag<-,lsyMatrix-method t,lspMatrix-method t,lsyMatrix-method
### Keywords: classes

### ** Examples

(M2 <- Matrix(c(TRUE, NA,FALSE,FALSE), 2,2)) # logical dense (ltr)
str(M2)
# can
(sM <- M2 | t(M2)) # "lge"
as(sM, "lsyMatrix")
str(sM <- as(sM, "lspMatrix")) # packed symmetric



