library(Matrix)


### Name: Matrix-class
### Title: Virtual Class "Matrix" Class of Matrices
### Aliases: Matrix-class !,Matrix-method -,Matrix,missing-method
###   +,Matrix,missing-method Arith,Matrix,Matrix-method
###   Ops,Matrix,Matrix-method Ops,Matrix,ANY-method Ops,ANY,Matrix-method
###   Ops,Matrix,NULL-method Ops,NULL,Matrix-method
###   Ops,Matrix,matrix-method Ops,matrix,Matrix-method
###   Ops,logical,Matrix-method Ops,Matrix,logical-method
###   Logic,logical,Matrix-method Logic,Matrix,logical-method
###   Logic,Matrix,ANY-method Logic,ANY,Matrix-method Summary,Matrix-method
###   Math2,Matrix-method mean,Matrix-method cbind2,ANY,Matrix-method
###   cbind2,Matrix,ANY-method cbind2,Matrix,Matrix-method
###   cbind2,Matrix,NULL-method cbind2,Matrix,atomicVector-method
###   cbind2,Matrix,missing-method cbind2,NULL,Matrix-method
###   cbind2,atomicVector,Matrix-method rbind2,ANY,Matrix-method
###   rbind2,Matrix,ANY-method rbind2,Matrix,Matrix-method
###   rbind2,Matrix,NULL-method rbind2,Matrix,atomicVector-method
###   rbind2,Matrix,missing-method rbind2,NULL,Matrix-method
###   rbind2,atomicVector,Matrix-method cov2cor,Matrix-method det
###   determinant,Matrix,missing-method determinant,Matrix,logical-method
###   diag,Matrix-method drop,Matrix-method head,Matrix-method
###   tail,Matrix-method diff,Matrix-method dim,Matrix-method
###   dim<-,Matrix-method dimnames,Matrix-method
###   dimnames<-,Matrix,list-method dimnames<-,Matrix,NULL-method
###   length,Matrix-method show,Matrix-method as.array,Matrix-method
###   as.matrix,Matrix-method as.vector,Matrix-method
###   as.numeric,Matrix-method as.logical,Matrix-method t,Matrix-method
###   unname,Matrix-method coerce,Matrix,vector-method
###   coerce,Matrix,numeric-method coerce,Matrix,logical-method
###   coerce,Matrix,integer-method coerce,Matrix,complex-method
###   coerce,Matrix,matrix-method coerce,matrix,Matrix-method
###   coerce,ANY,Matrix-method coerce,Matrix,denseMatrix-method
###   coerce,Matrix,CsparseMatrix-method coerce,Matrix,sparseMatrix-method
###   rep,Matrix-method svd,Matrix-method unname,Matrix,missing-method
###   print.Matrix
### Keywords: classes algebra

### ** Examples

slotNames("Matrix")

cl <- getClass("Matrix")
names(cl@subclasses) # more than 40 ..

showClass("Matrix")#> output with slots and all subclasses

(M <- Matrix(c(0,1,0,0), 6, 4))
dim(M)
diag(M)
cm <- M[1:4,] + 10*Diagonal(4)
diff(M)
## can reshape it even :
dim(M) <- c(2, 12)
M
stopifnot(identical(M, Matrix(c(0,1,0,0), 2,12)),
          all.equal(det(cm),
                    determinant(as(cm,"matrix"), log=FALSE)$modulus,
                    check.attributes=FALSE))



