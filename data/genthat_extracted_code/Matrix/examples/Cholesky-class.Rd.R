library(Matrix)


### Name: Cholesky-class
### Title: Cholesky and Bunch-Kaufman Decompositions
### Aliases: Cholesky-class pCholesky-class BunchKaufman-class
###   pBunchKaufman-class coerce,pCholesky,lMatrix-method
###   coerce,pBunchKaufman,lMatrix-method coerce,Cholesky,lMatrix-method
###   coerce,BunchKaufman,lMatrix-method show,BunchKaufman-method
###   show,pBunchKaufman-method
### Keywords: classes algebra

### ** Examples

(sm <- as(as(Matrix(diag(5) + 1), "dsyMatrix"), "dspMatrix"))
signif(csm <- chol(sm), 4)

(pm <- crossprod(Matrix(rnorm(18), nrow = 6, ncol = 3)))
(ch <- chol(pm))
if (toupper(ch@uplo) == "U") # which is TRUE
   crossprod(ch)
stopifnot(all.equal(as(crossprod(ch), "matrix"),
                    as(pm, "matrix"), tolerance=1e-14))



