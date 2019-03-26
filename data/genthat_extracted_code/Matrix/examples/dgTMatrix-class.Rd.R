library(Matrix)


### Name: dgTMatrix-class
### Title: Sparse matrices in triplet form
### Aliases: dgTMatrix-class +,dgTMatrix,dgTMatrix-method
###   coerce,dgTMatrix,dgCMatrix-method coerce,dgTMatrix,dgeMatrix-method
###   coerce,dgTMatrix,matrix-method coerce,dgTMatrix,dtCMatrix-method
###   coerce,dgTMatrix,dsTMatrix-method coerce,dgTMatrix,dtTMatrix-method
###   coerce,dgTMatrix,symmetricMatrix-method
###   coerce,dgTMatrix,triangularMatrix-method
###   coerce,dgeMatrix,dgTMatrix-method coerce,matrix,dgTMatrix-method
### Keywords: classes algebra

### ** Examples

m <- Matrix(0+1:28, nrow = 4)
m[-3,c(2,4:5,7)] <- m[ 3, 1:4] <- m[1:3, 6] <- 0
(mT <- as(m, "dgTMatrix"))
str(mT)
mT[1,]
mT[4, drop = FALSE]
stopifnot(identical(mT[lower.tri(mT)],
                    m [lower.tri(m) ]))
mT[lower.tri(mT,diag=TRUE)] <- 0
mT

## Triplet representation with repeated (i,j) entries
## *adds* the corresponding x's:
T2 <- new("dgTMatrix",
          i = as.integer(c(1,1,0,3,3)),
          j = as.integer(c(2,2,4,0,0)), x=10*1:5, Dim=4:5)
str(T2) # contains (i,j,x) slots exactly as above, but
T2 ## has only three non-zero entries, as for repeated (i,j)'s,
   ## the corresponding x's are "implicitly" added
stopifnot(nnzero(T2) == 3)



