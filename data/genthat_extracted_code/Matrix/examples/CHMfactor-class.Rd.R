library(Matrix)


### Name: CHMfactor-class
### Title: CHOLMOD-based Cholesky Factorizations
### Aliases: CHMfactor-class CHMsimpl-class CHMsuper-class dCHMsimpl-class
###   nCHMsimpl-class dCHMsuper-class nCHMsuper-class isLDL
###   coerce,CHMfactor,Matrix-method coerce,CHMfactor,sparseMatrix-method
###   coerce,CHMfactor,triangularMatrix-method
###   coerce,CHMfactor,pMatrix-method expand,CHMfactor-method
###   determinant,CHMfactor,missing-method
###   determinant,CHMfactor,logical-method update,CHMfactor-method
###   .updateCHMfactor
### Keywords: classes algebra

### ** Examples

## An example for the expand() method
n <- 1000; m <- 200; nnz <- 2000
set.seed(1)
M1 <- spMatrix(n, m,
               i = sample(n, nnz, replace = TRUE),
               j = sample(m, nnz, replace = TRUE),
               x = round(rnorm(nnz),1))
XX <- crossprod(M1) ## = M1'M1  = M M'  where M <- t(M1)
CX <- Cholesky(XX)
isLDL(CX)
str(CX) ## a "dCHMsimpl" object
r <- expand(CX)
L.P <- with(r, crossprod(L,P))  ## == L'P
PLLP <- crossprod(L.P)          ## == (L'P)' L'P == P'LL'P  = XX = M M'
b <- sample(m)
stopifnot(all.equal(PLLP, XX), 
          all(as.vector(solve(CX, b, system="P" )) == r$P %*% b),
          all(as.vector(solve(CX, b, system="Pt")) == t(r$P) %*% b) )

u1 <- update(CX, XX,    mult=pi)
u2 <- update(CX, t(M1), mult=pi) # with the original M, where XX = M M'
stopifnot(all.equal(u1,u2, tol=1e-14))

   ## [ See  help(Cholesky)  for more examples ]
   ##        -------------



