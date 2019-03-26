library(Matrix)


### Name: ntrMatrix-class
### Title: Triangular Dense Logical Matrices
### Aliases: ntpMatrix-class ntrMatrix-class !,ntpMatrix-method
###   !,ntrMatrix-method coerce,ntpMatrix,dtpMatrix-method
###   coerce,ntpMatrix,ngeMatrix-method coerce,ntpMatrix,ntrMatrix-method
###   coerce,ntrMatrix,dtrMatrix-method coerce,ntrMatrix,ngeMatrix-method
###   coerce,ntrMatrix,ntpMatrix-method coerce,matrix,ntrMatrix-method
###   coerce,matrix,ntpMatrix-method diag<-,ntpMatrix-method
###   diag<-,ntrMatrix-method t,ntpMatrix-method t,ntrMatrix-method
### Keywords: classes

### ** Examples

showClass("ntrMatrix")

str(new("ntpMatrix"))
(nutr <- as(upper.tri(matrix(,4,4)), "ntrMatrix"))
str(nutp <- as(nutr, "ntpMatrix"))# packed matrix: only 10 = (4+1)*4/2 entries
!nutp ## the logical negation (is *not* logical triangular !)
## but this one is:
stopifnot(all.equal(nutp, as(!!nutp, "ntpMatrix")))



