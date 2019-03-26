library(Matrix)


### Name: sparseVector-class
### Title: Sparse Vector Classes
### Aliases: sparseVector-class dsparseVector-class isparseVector-class
###   lsparseVector-class nsparseVector-class zsparseVector-class
###   xsparseVector-class Arith,sparseVector,sparseVector-method
###   Arith,dsparseVector,dsparseVector-method
###   -,dsparseVector,missing-method !,sparseVector-method
###   Logic,sparseVector,sparseVector-method
###   Logic,lsparseVector,lsparseVector-method
###   Logic,nsparseVector,nsparseVector-method Ops,ANY,sparseVector-method
###   Ops,sparseVector,ANY-method Ops,sparseVector,sparseVector-method
###   Ops,sparseVector,atomicVector-method
###   Ops,atomicVector,sparseVector-method Ops,Matrix,sparseVector-method
###   Ops,sparseVector,Matrix-method Arith,ddenseMatrix,sparseVector-method
###   Arith,dgeMatrix,sparseVector-method
###   Arith,sparseVector,ddenseMatrix-method
###   Arith,sparseVector,dgeMatrix-method Logic,dMatrix,sparseVector-method
###   Logic,lMatrix,sparseVector-method Logic,nMatrix,sparseVector-method
###   Logic,sparseVector,dMatrix-method Logic,sparseVector,lMatrix-method
###   Logic,sparseVector,nMatrix-method Math,sparseVector-method
###   Math2,dsparseVector-method Math2,sparseVector-method
###   Summary,sparseVector-method Summary,nsparseVector-method
###   coerce,ANY,sparseVector-method coerce,ANY,nsparseVector-method
###   coerce,CsparseMatrix,sparseVector-method
###   coerce,TsparseMatrix,sparseVector-method
###   coerce,sparseMatrix,sparseVector-method
###   coerce,diagonalMatrix,sparseVector-method
###   coerce,atomicVector,sparseVector-method
###   coerce,atomicVector,dsparseVector-method
###   coerce,sparseVector,integer-method coerce,sparseVector,logical-method
###   coerce,sparseVector,numeric-method coerce,sparseVector,vector-method
###   coerce,sparseVector,Matrix-method
###   coerce,sparseVector,sparseMatrix-method
###   coerce,sparseVector,CsparseMatrix-method
###   coerce,sparseVector,TsparseMatrix-method
###   coerce,nsparseVector,lsparseVector-method
###   coerce,nsparseVector,dsparseVector-method
###   coerce,nsparseVector,isparseVector-method
###   coerce,nsparseVector,zsparseVector-method
###   coerce,xsparseVector,dsparseVector-method
###   coerce,xsparseVector,isparseVector-method
###   coerce,xsparseVector,lsparseVector-method
###   coerce,xsparseVector,zsparseVector-method
###   coerce,xsparseVector,nsparseVector-method
###   as.logical,sparseVector-method as.numeric,sparseVector-method
###   as.vector,sparseVector-method c.sparseVector
###   dim<-,sparseVector-method is.na,nsparseVector-method
###   is.na,sparseVector-method is.finite,nsparseVector-method
###   is.finite,sparseVector-method is.infinite,nsparseVector-method
###   is.infinite,sparseVector-method length,sparseVector-method
###   mean,sparseVector-method rep,sparseVector-method
###   show,sparseVector-method t,sparseVector-method
###   toeplitz,sparseVector-method head,sparseVector-method
###   tail,sparseVector-method which,nsparseVector-method
###   which,lsparseVector-method [,sparseVector,index,ANY,ANY-method
###   [,sparseVector,lsparseVector,ANY,ANY-method
###   [,sparseVector,nsparseVector,ANY,ANY-method
###   [<-,sparseVector,index,missing,replValueSp-method
###   [<-,sparseVector,sparseVector,missing,replValueSp-method
### Keywords: classes

### ** Examples

getClass("sparseVector")
getClass("dsparseVector")
getClass("xsparseVector")# those with an 'x' slot

sx <- c(0,0,3, 3.2, 0,0,0,-3:1,0,0,2,0,0,5,0,0)
(ss <- as(sx, "sparseVector"))

ix <- as.integer(round(sx))
(is <- as(ix, "sparseVector")) ## an "isparseVector" (!)
(ns <- sparseVector(i= c(7, 3, 2), length = 10)) # "nsparseVector"
## rep() works too:
(ri <- rep(is, length.out= 25))

## Using `dim<-`  as in base R :
r <- ss
dim(r) <- c(4,5) # becomes a sparse Matrix:
r
## or coercion (as as.matrix() in base R):
as(ss, "Matrix")
stopifnot(all(ss == print(as(ss, "CsparseMatrix"))))

## currently has "non-structural" FALSE -- printing as ":"
(lis <- is & FALSE)
(nn <- is[is == 0]) # all "structural" FALSE

## NA-case
sN <- sx; sN[4] <- NA
(svN <- as(sN, "sparseVector"))

v <- as(c(0,0,3, 3.2, rep(0,9),-3,0,-1, rep(0,20),5,0),
         "sparseVector")
v <- rep(rep(v, 50), 5000)
set.seed(1); v[sample(v@i, 1e6)] <- 0
str(v)
system.time(for(i in 1:4) hv <- head(v, 1e6))
##   user  system elapsed
##  0.033   0.000   0.032
system.time(for(i in 1:4) h2 <- v[1:1e6])
##   user  system elapsed
##  1.317   0.000   1.319

stopifnot(identical(hv, h2),
          identical(is | FALSE, is != 0),
	  validObject(svN), validObject(lis), as.logical(is.na(svN[4])),
	  identical(is^2 > 0,	is & TRUE),
	  all(!lis), !any(lis), length(nn@i) == 0, !any(nn), all(!nn),
	  sum(lis) == 0, !prod(lis), range(lis) == c(0,0))

## create and use the t(.) method:
t(x20 <- sparseVector(c(9,3:1), i=c(1:2,4,7), length=20))
(T20 <- toeplitz(x20))
stopifnot(is(T20, "symmetricMatrix"), is(T20, "sparseMatrix"),
	  identical(unname(as.matrix(T20)),
                    toeplitz(as.vector(x20))))

## c() method for "sparseVector" - also available as regular function
(c1 <- c(x20, 0,0,0, -10*x20))
(c2 <- c(ns, is, FALSE))
(c3 <- c(ns, !ns, TRUE, NA, FALSE))
(c4 <- c(ns, rev(ns)))
## here, c() would produce a list {not dispatching to c.sparseVector()}
(c5 <- c.sparseVector(0,0, x20))

## checking (consistency)
.v <- as.vector
.s <- function(v) as(v, "sparseVector")
stopifnot(
  all.equal(c1, .s(c(.v(x20), 0,0,0, -10*.v(x20))),      tol=0),
  all.equal(c2, .s(c(.v(ns), .v(is), FALSE)),            tol=0),
  all.equal(c3, .s(c(.v(ns), !.v(ns), TRUE, NA, FALSE)), tol=0),
  all.equal(c4, .s(c(.v(ns), rev(.v(ns)))),              tol=0),
  all.equal(c5, .s(c(0,0, .v(x20))),                     tol=0)
)



