library(Matrix)


### Name: ltrMatrix-class
### Title: Triangular Dense Logical Matrices
### Aliases: ltpMatrix-class ltrMatrix-class !,ltpMatrix-method
###   !,ltrMatrix-method coerce,ltpMatrix,dtpMatrix-method
###   coerce,ltpMatrix,lgeMatrix-method coerce,ltpMatrix,ltrMatrix-method
###   coerce,ltrMatrix,dtrMatrix-method coerce,ltrMatrix,lgeMatrix-method
###   coerce,ltrMatrix,ltpMatrix-method coerce,matrix,ltrMatrix-method
###   coerce,matrix,ltpMatrix-method diag,ltrMatrix-method
###   diag,ltpMatrix-method diag<-,ltpMatrix-method diag<-,ltrMatrix-method
###   t,ltpMatrix-method t,ltrMatrix-method
### Keywords: classes

### ** Examples

showClass("ltrMatrix")

str(new("ltpMatrix"))
(lutr <- as(upper.tri(matrix(,4,4)), "ltrMatrix"))
str(lutp <- as(lutr, "ltpMatrix"))# packed matrix: only 10 = (4+1)*4/2 entries
!lutp ## the logical negation (is *not* logical triangular !)
## but this one is:
stopifnot(all.equal(lutp, as(!!lutp, "ltpMatrix")))



