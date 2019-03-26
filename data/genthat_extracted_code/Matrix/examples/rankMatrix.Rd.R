library(Matrix)


### Name: rankMatrix
### Title: Rank of a Matrix
### Aliases: rankMatrix
### Keywords: algebra array

### ** Examples

rankMatrix(cbind(1, 0, 1:3)) # 2

(meths <- eval(formals(rankMatrix)$method))

## a "border" case:
H12 <- Hilbert(12)
rankMatrix(H12, tol = 1e-20) # 12;  but  11  with default method & tol.
sapply(meths, function(.m.) rankMatrix(H12, method = .m.))
## tolNorm2    qr   qr.R  qrLINPACK  useGrad maybeGrad
##       11    12     11         12       11        11
## The meaning of 'tol' for method="qrLINPACK" and *dense* x is not entirely "scale free"
rMQL <- function(ex, M) rankMatrix(M, method="qrLINPACK",tol = 10^-ex)
rMQR <- function(ex, M) rankMatrix(M, method="qr.R",     tol = 10^-ex)
sapply(5:15, rMQL, M = H12) # result is platform dependent
##  7  7  8 10 10 11 11 11 12 12 12  {x86_64}
sapply(5:15, rMQL, M = 1000 * H12) # not identical unfortunately
##  7  7  8 10 11 11 12 12 12 12 12
sapply(5:15, rMQR, M = H12)
##  5  6  7  8  8  9  9 10 10 11 11
sapply(5:15, rMQR, M = 1000 * H12) # the *same*
## Don't show: 
  (r12 <- sapply(5:15, rMQR, M = H12))
  stopifnot(identical(r12, sapply(5:15, rMQR, M = H12 / 100)),
            identical(r12, sapply(5:15, rMQR, M = H12 * 1e5)))

  rM1 <- function(ex, M) rankMatrix(M, tol = 10^-ex)
  (r12 <- sapply(5:15, rM1, M = H12))
  stopifnot(identical(r12, sapply(5:15, rM1, M = H12 / 100)),
            identical(r12, sapply(5:15, rM1, M = H12 * 1e5)))
## End(Don't show)

## "sparse" case:
M15 <- kronecker(diag(x=c(100,1,10)), Hilbert(5))
sapply(meths, function(.m.) rankMatrix(M15, method = .m.))
#--> all 15, but 'useGrad' has 14.

## "large" sparse
n <- 250000; p <- 33; nnz <- 10000
L <- sparseMatrix(i = sample.int(n, nnz, replace=TRUE),
                  j = sample.int(p, nnz, replace=TRUE), x = rnorm(nnz))
(st1 <- system.time(r1 <- rankMatrix(L)))                # warning+ ~1.5 sec (2013)
(st2 <- system.time(r2 <- rankMatrix(L, method = "qr"))) # considerably faster!
r1[[1]] == print(r2[[1]]) ## -->  ( 33  TRUE )
## Don't show: 
 stopifnot(r1[[1]] == 33, 33 == r2[[1]])
 if(doExtras <- interactive() ||
	identical("true", unname(Sys.getenv("R_PKG_CHECKING_doExtras"))))
  stopifnot(st2[[1]] < 0.2) # seeing 0.03 (on ~ 2010-hardware; R 3.0.2)
## End(Don't show)
## another sparse-"qr" one, which ``failed'' till 2013-11-23:
set.seed(42)
f1 <- factor(sample(50, 1000, replace=TRUE))
f2 <- factor(sample(50, 1000, replace=TRUE))
f3 <- factor(sample(50, 1000, replace=TRUE))
rbind. <- if(getRversion() < "3.2.0") rBind else rbind
D <- t(do.call(rbind., lapply(list(f1,f2,f3), as, 'sparseMatrix')))
dim(D); nnzero(D) ## 1000 x 150 // 3000 non-zeros (= 2%)
stopifnot(rankMatrix(D,           method='qr') == 148,
	  rankMatrix(crossprod(D),method='qr') == 148)

## zero matrix has rank 0 :
stopifnot(sapply(meths, function(.m.)
                        rankMatrix(matrix(0, 2, 2), method = .m.)) == 0)



