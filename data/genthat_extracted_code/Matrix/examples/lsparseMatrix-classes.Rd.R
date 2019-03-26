library(Matrix)


### Name: lsparseMatrix-classes
### Title: Sparse logical matrices
### Aliases: lsparseMatrix-class lgCMatrix-class ltCMatrix-class
###   lsCMatrix-class lgRMatrix-class ltRMatrix-class lsRMatrix-class
###   lgTMatrix-class ltTMatrix-class lsTMatrix-class
###   Ops,lsparseMatrix,lsparseMatrix-method
###   Arith,lsparseMatrix,Matrix-method Arith,Matrix,lsparseMatrix-method
###   Arith,lgCMatrix,lgCMatrix-method Arith,lgTMatrix,lgTMatrix-method
###   Compare,lsparseMatrix,lsparseMatrix-method
###   Logic,lsparseMatrix,lsparseMatrix-method
###   Logic,lgCMatrix,lgCMatrix-method Logic,lgTMatrix,lgTMatrix-method
###   Logic,lsCMatrix,lsCMatrix-method Logic,ltCMatrix,ltCMatrix-method
###   -,lsparseMatrix,missing-method !,lsparseMatrix-method
###   coerce,lsparseMatrix,matrix-method
###   coerce,lsparseMatrix,dsparseMatrix-method
###   coerce,lgCMatrix,dgCMatrix-method coerce,lgCMatrix,lgTMatrix-method
###   coerce,lgCMatrix,lgeMatrix-method coerce,lgCMatrix,lsCMatrix-method
###   coerce,lgCMatrix,ltCMatrix-method coerce,lgCMatrix,matrix-method
###   coerce,lgTMatrix,dgTMatrix-method coerce,lgTMatrix,lgCMatrix-method
###   coerce,lgTMatrix,lgeMatrix-method coerce,lgTMatrix,lsCMatrix-method
###   coerce,lgTMatrix,triangularMatrix-method
###   coerce,lgTMatrix,symmetricMatrix-method
###   coerce,lgTMatrix,ltTMatrix-method coerce,lgTMatrix,matrix-method
###   coerce,lsCMatrix,dgTMatrix-method coerce,lsCMatrix,dsCMatrix-method
###   coerce,lsCMatrix,generalMatrix-method
###   coerce,lsCMatrix,lgCMatrix-method coerce,lsCMatrix,lgTMatrix-method
###   coerce,lsCMatrix,lsTMatrix-method coerce,lsCMatrix,matrix-method
###   coerce,lsTMatrix,dsTMatrix-method coerce,lsTMatrix,lgCMatrix-method
###   coerce,lsTMatrix,lgTMatrix-method coerce,lsTMatrix,lsCMatrix-method
###   coerce,lsTMatrix,lsyMatrix-method coerce,lsTMatrix,matrix-method
###   coerce,ltCMatrix,dMatrix-method coerce,ltCMatrix,dtCMatrix-method
###   coerce,ltCMatrix,lgCMatrix-method coerce,ltCMatrix,ltTMatrix-method
###   coerce,ltCMatrix,matrix-method coerce,ltTMatrix,dtTMatrix-method
###   coerce,ltTMatrix,generalMatrix-method
###   coerce,ltTMatrix,lgCMatrix-method coerce,ltTMatrix,lgTMatrix-method
###   coerce,ltTMatrix,ltCMatrix-method coerce,ltTMatrix,ltrMatrix-method
###   coerce,ltTMatrix,matrix-method coerce,matrix,lgCMatrix-method
###   coerce,matrix,lgTMatrix-method coerce,matrix,lsCMatrix-method
###   coerce,matrix,ltCMatrix-method coerce,matrix,ltTMatrix-method
###   t,lgCMatrix-method t,lgTMatrix-method t,lsCMatrix-method
###   t,ltCMatrix-method t,lsTMatrix-method t,ltTMatrix-method
###   which,lgTMatrix-method which,lsparseMatrix-method
###   which,lsTMatrix-method which,ltTMatrix-method
### Keywords: classes algebra

### ** Examples

(m <- Matrix(c(0,0,2:0), 3,5, dimnames=list(LETTERS[1:3],NULL)))
(lm <- (m > 1)) # lgC
!lm     # no longer sparse
stopifnot(is(lm,"lsparseMatrix"),
          identical(!lm, m <= 1))

data(KNex)
str(mmG.1 <- (KNex $ mm) > 0.1)# "lgC..."
table(mmG.1@x)# however with many ``non-structural zeros''
## from logical to nz_pattern -- okay when there are no NA's :
nmG.1 <- as(mmG.1, "nMatrix") # <<< has "TRUE" also where mmG.1 had FALSE
## from logical to "double"
dmG.1 <- as(mmG.1, "dMatrix") # has '0' and back:
lmG.1 <- as(dmG.1, "lMatrix") # has no extra FALSE, i.e. drop0() included
stopifnot(identical(nmG.1, as((KNex $ mm) != 0,"nMatrix")),
          validObject(lmG.1), all(lmG.1@x),
          # same "logical" but lmG.1 has no 'FALSE' in x slot:
          all(lmG.1 == mmG.1))

class(xnx <- crossprod(nmG.1))# "nsC.."
class(xlx <- crossprod(mmG.1))# "dsC.." : numeric
is0 <- (xlx == 0)
mean(as.vector(is0))# 99.3% zeros: quite sparse, but
table(xlx@x == 0)# more than half of the entries are (non-structural!) 0
stopifnot(isSymmetric(xlx), isSymmetric(xnx),
          ## compare xnx and xlx : have the *same* non-structural 0s :
          sapply(slotNames(xnx),
                 function(n) identical(slot(xnx, n), slot(xlx, n))))



