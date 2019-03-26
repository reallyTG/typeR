library(Matrix)


### Name: indMatrix-class
### Title: Index Matrices
### Aliases: indMatrix-class -,indMatrix,missing-method
###   coerce,integer,indMatrix-method coerce,numeric,indMatrix-method
###   coerce,list,indMatrix-method coerce,matrix,indMatrix-method
###   coerce,sparseMatrix,indMatrix-method coerce,indMatrix,matrix-method
###   coerce,indMatrix,ngeMatrix-method coerce,indMatrix,ngTMatrix-method
###   coerce,indMatrix,dMatrix-method coerce,indMatrix,lMatrix-method
###   coerce,indMatrix,nMatrix-method coerce,indMatrix,CsparseMatrix-method
###   coerce,indMatrix,TsparseMatrix-method
###   coerce,indMatrix,dsparseMatrix-method
###   coerce,indMatrix,lsparseMatrix-method
###   coerce,indMatrix,nsparseMatrix-method coerce,nMatrix,indMatrix-method
###   determinant,indMatrix,logical-method isSymmetric,indMatrix-method
###   Summary,indMatrix-method rbind2,indMatrix,indMatrix-method
###   t,indMatrix-method colSums,indMatrix-method colMeans,indMatrix-method
###   rowSums,indMatrix-method rowMeans,indMatrix-method
### Keywords: classes

### ** Examples

p1 <- as(c(2,3,1), "pMatrix")
(sm1 <- as(rep(c(2,3,1), e=3), "indMatrix"))
stopifnot(all(sm1 == p1[rep(1:3, each=3),]))

## row-indexing of a <pMatrix> turns it into an <indMatrix>:
class(p1[rep(1:3, each=3),])

set.seed(12) # so we know '10' is in sample
## random index matrix for 30 observations and 10 unique values:
(s10 <- as(sample(10, 30, replace=TRUE),"indMatrix"))

## Sample rows of a numeric matrix :
(mm <- matrix(1:10, nrow=10, ncol=3))
s10 %*% mm

set.seed(27)
IM1 <- as(sample(1:20, 100, replace=TRUE), "indMatrix")
IM2 <- as(sample(1:18, 100, replace=TRUE), "indMatrix")
(c12 <- crossprod(IM1,IM2))
## same as cross-tabulation of the two index vectors:
stopifnot(all(c12 - unclass(table(IM1@perm, IM2@perm)) == 0))

# 3 observations, 4 implied values, first does not occur in sample:
as(2:4, "indMatrix")
# 3 observations, 5 values, first and last do not occur in sample:
as(list(2:4, 5), "indMatrix")

as(sm1, "ngTMatrix")
s10[1:7, 1:4] # gives an "ngTMatrix" (most economic!)
s10[1:4, ]  # preserves "indMatrix"-class

I1 <- as(c(5:1,6:4,7:3), "indMatrix")
I2 <- as(7:1, "pMatrix")
(I12 <- suppressWarnings(rBind(I1, I2)))
stopifnot(is(I12, "indMatrix"),
          if(getRversion() >= "3.2.0") identical(I12, rbind(I1, I2)) else TRUE,
	  colSums(I12) == c(2L,2:4,4:2))



