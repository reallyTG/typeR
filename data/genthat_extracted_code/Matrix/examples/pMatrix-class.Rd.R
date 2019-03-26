library(Matrix)


### Name: pMatrix-class
### Title: Permutation matrices
### Aliases: pMatrix-class -,pMatrix,missing-method
###   coerce,integer,pMatrix-method coerce,numeric,pMatrix-method
###   coerce,matrix,pMatrix-method coerce,sparseMatrix,pMatrix-method
###   coerce,pMatrix,matrix-method coerce,pMatrix,ngeMatrix-method
###   coerce,pMatrix,ngTMatrix-method coerce,pMatrix,lMatrix-method
###   coerce,pMatrix,dMatrix-method coerce,pMatrix,nMatrix-method
###   coerce,pMatrix,CsparseMatrix-method
###   coerce,pMatrix,TsparseMatrix-method
###   coerce,pMatrix,dsparseMatrix-method
###   coerce,pMatrix,nsparseMatrix-method coerce,nMatrix,pMatrix-method
###   determinant,pMatrix,logical-method Summary,pMatrix-method
###   t,pMatrix-method
### Keywords: classes

### ** Examples

(pm1 <- as(as.integer(c(2,3,1)), "pMatrix"))
t(pm1) # is the same as
solve(pm1)
pm1 %*% t(pm1) # check that the transpose is the inverse
stopifnot(all(diag(3) == as(pm1 %*% t(pm1), "matrix")),
          is.logical(as(pm1, "matrix")))

set.seed(11)
## random permutation matrix :
(p10 <- as(sample(10),"pMatrix"))

## Permute rows / columns of a numeric matrix :
(mm <- round(array(rnorm(3 * 3), c(3, 3)), 2))
mm %*% pm1
pm1 %*% mm
try(as(as.integer(c(3,3,1)), "pMatrix"))# Error: not a permutation

as(pm1, "ngTMatrix")
p10[1:7, 1:4] # gives an "ngTMatrix" (most economic!)

## row-indexing of a <pMatrix> keeps it as an <indMatrix>:
p10[1:3, ]



