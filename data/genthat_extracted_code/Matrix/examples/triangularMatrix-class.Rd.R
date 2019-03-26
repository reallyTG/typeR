library(Matrix)


### Name: triangularMatrix-class
### Title: Virtual Class of Triangular Matrices in Package Matrix
### Aliases: triangularMatrix-class
###   coerce,triangularMatrix,symmetricMatrix-method
###   coerce,lgeMatrix,triangularMatrix-method
###   coerce,ngeMatrix,triangularMatrix-method
###   coerce,matrix,triangularMatrix-method
### Keywords: classes

### ** Examples

showClass("triangularMatrix")

## The names of direct subclasses:
scl <- getClass("triangularMatrix")@subclasses
directly <- sapply(lapply(scl, slot, "by"), length) == 0
names(scl)[directly]

(m <- matrix(c(5,1,0,3), 2))
as(m, "triangularMatrix")



