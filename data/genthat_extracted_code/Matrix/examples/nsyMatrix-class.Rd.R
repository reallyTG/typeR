library(Matrix)


### Name: nsyMatrix-class
### Title: Symmetric Dense Nonzero-Pattern Matrices
### Aliases: nspMatrix-class nsyMatrix-class
###   coerce,nspMatrix,dspMatrix-method coerce,nspMatrix,nsyMatrix-method
###   coerce,nspMatrix,ngeMatrix-method coerce,nsyMatrix,dsyMatrix-method
###   coerce,nsyMatrix,ngeMatrix-method coerce,nsyMatrix,nspMatrix-method
###   coerce,matrix,nsyMatrix-method coerce,matrix,nspMatrix-method
###   diag<-,nspMatrix-method diag<-,nsyMatrix-method t,nspMatrix-method
###   t,nsyMatrix-method
### Keywords: classes

### ** Examples

(s0 <- new("nsyMatrix"))

(M2 <- Matrix(c(TRUE, NA,FALSE,FALSE), 2,2)) # logical dense (ltr)
(sM <- M2 & t(M2))      # "lge"
class(sM <- as(sM, "nMatrix")) # -> "nge"
     (sM <- as(sM, "nsyMatrix")) # -> "nsy"
str ( sM <- as(sM, "nspMatrix")) # -> "nsp": packed symmetric



