## Validate dist.matrix() implementation against pure R code using dist() and matrix operations
## based on small "hieroglyphs" example matrix

library(wordspace)
library(Matrix)

matrix.equal <- function(x, y, name="matrix comparison", tol=1e-10, verbose=TRUE) {
  if (nrow(x) == nrow(y) && ncol(x) == ncol(y)) {
    max.diff <- max(abs(x - y))
    if (max.diff < tol) {
      invisible(TRUE)
    } else {
      if (verbose) cat(sprintf("%s: largest difference between matrices = %g exceeds tolerance limit\n", name, max.diff))
      invisible(FALSE)
    }
  } else {
    if (verbose) cat(sprintf("%s: different matrix formats %d x %d != %d x %d\n", name, nrow(x), ncol(x), nrow(y), ncol(y)))
    invisible(FALSE)
  }
}


## test data: sparse and dense co-occurrence matrix
O <- DSM_HieroglyphsMatrix
E <- outer(rowSums(O), colSums(O)) / sum(O)
M1 <- (O - E) / sqrt(E)               # z-score (signed), dense matrix
M2 <- as(pmax(M1, 0), "sparseMatrix") # sparse z-score, sparse matrix


## Euclidean distance
M1.l2.ws <- dist.matrix(M1, method="euclidean")
M2.l2.ws <- dist.matrix(M2, method="euclidean")

M1.l2.R <- dist(M1, method="euclidean") 
M2.l2.R <- dist(M2, method="euclidean") # converts to dense matrix

stopifnot(matrix.equal(M1.l2.ws, as.matrix(M1.l2.R)))
stopifnot(matrix.equal(M2.l2.ws, as.matrix(M2.l2.R)))
stopifnot(all(diag(M1.l2.ws) == 0)) # must be exact zeroes
stopifnot(all(diag(M2.l2.ws) == 0))


## Manhattan distance
M1.l1.ws <- dist.matrix(M1, method="manhattan")
M2.l1.ws <- dist.matrix(M2, method="manhattan")

M1.l1.R <- dist(M1, method="manhattan") 
M2.l1.R <- dist(M2, method="manhattan") # converts to dense matrix

stopifnot(matrix.equal(M1.l1.ws, as.matrix(M1.l1.R)))
stopifnot(matrix.equal(M2.l1.ws, as.matrix(M2.l1.R)))
stopifnot(all(diag(M1.l1.ws) == 0)) # must be exact zeroes
stopifnot(all(diag(M2.l1.ws) == 0))


## maximum distance
M1.linf.ws <- dist.matrix(M1, method="maximum")
M2.linf.ws <- dist.matrix(M2, method="maximum")

M1.linf.R <- dist(M1, method="maximum") 
M2.linf.R <- dist(M2, method="maximum") # converts to dense matrix

stopifnot(matrix.equal(M1.linf.ws, as.matrix(M1.linf.R)))
stopifnot(matrix.equal(M2.linf.ws, as.matrix(M2.linf.R)))
stopifnot(all(diag(M1.linf.ws) == 0)) # must be exact zeroes
stopifnot(all(diag(M2.linf.ws) == 0))


## Minkowski distance
for (p in c(.1, .25, .5, 1, 1.5, 2, 2.5, 3, 5, 10)) {
  M1.lp.ws <- dist.matrix(M1, method="minkowski", p=p)
  M2.lp.ws <- dist.matrix(M2, method="minkowski", p=p)

  if (p < 1) {
    ## dist.matrix() uses non-standard definition of Minkowski distance for p < 1
    M1.lp.ws <- M1.lp.ws ^ (1/p)
    M2.lp.ws <- M2.lp.ws ^ (1/p)
  }
  
  M1.lp.R <- dist(M1, method="minkowski", p=p) 
  M2.lp.R <- dist(M2, method="minkowski", p=p) # converts to dense matrix

  stopifnot(matrix.equal(M1.lp.ws, as.matrix(M1.lp.R), tol=1e-6)) # dist() seems to use different alogrithm
  stopifnot(matrix.equal(M2.lp.ws, as.matrix(M2.lp.R), tol=1e-6)) # resulting in larger errors on 32-bit i386 
  stopifnot(all(diag(M1.lp.ws) == 0)) # must be exact zeroes
  stopifnot(all(diag(M2.lp.ws) == 0))

  if (p == 1) {
    stopifnot(matrix.equal(M1.lp.ws, as.matrix(M1.l1.ws)))
    stopifnot(matrix.equal(M2.lp.ws, as.matrix(M2.l1.ws)))
  }
  if (p == 2) {
    stopifnot(matrix.equal(M1.lp.ws, as.matrix(M1.l2.ws)))
    stopifnot(matrix.equal(M2.lp.ws, as.matrix(M2.l2.ws)))
  }
}


## Canberra distance
##  - wordspace package implements different form of Canberra distance than dist()
##  - version in dist.matrix() is more sensible for vectors that have both positive and negative entries
##  - dist() and dist.matrix() also disagree on matching zeroes (which dist() imputes as missing values)

M1a <- abs(M1)  # so all entries are positive
M2a <- M2 + 1   # ensure that no two row vectors have matching zeroes
diag(M2a) <- 0
M2a <- as(M2a, "dgCMatrix") # convert back to sparse matrix

M1a.cb.ws <- dist.matrix(M1a, method="canberra")
M2a.cb.ws <- dist.matrix(M2a, method="canberra")

M1a.cb.R <- dist(M1a, method="canberra") 
M2a.cb.R <- dist(M2a, method="canberra") # converts to dense matrix

stopifnot(matrix.equal(M1a.cb.ws, as.matrix(M1a.cb.R)))
stopifnot(matrix.equal(M2a.cb.ws, as.matrix(M2a.cb.R)))
stopifnot(all(diag(M1a.cb.ws) == 0)) # must be exact zeroes
stopifnot(all(diag(M2a.cb.ws) == 0))


## cosine similarity and angular distance
M1n <- normalize.rows(M1)
M2n <- normalize.rows(M2)

M1.cos.ws <- dist.matrix(M1, method="cosine", convert=FALSE, normalized=FALSE)
M1n.cos.ws <- dist.matrix(M1n, method="cosine", convert=FALSE, normalized=TRUE)

M2.cos.ws <- dist.matrix(M2, method="cosine", convert=FALSE, normalized=FALSE)
M2n.cos.ws <- dist.matrix(M2n, method="cosine", convert=FALSE, normalized=TRUE)

M1n.cos.R <- tcrossprod(M1n)
M2n.cos.R <- as.matrix(tcrossprod(M2n))

stopifnot(matrix.equal(M1.cos.ws, M1n.cos.R))
stopifnot(matrix.equal(M1n.cos.ws, M1n.cos.R))
stopifnot(matrix.equal(M2.cos.ws, M2n.cos.R))
stopifnot(matrix.equal(M2n.cos.ws, M2n.cos.R))

tmp <- pmin(M1n.cos.R, 1)
tmp[tmp > 1-(1e-12)] <- 1 # clamping function of dist.matrix()
M1.deg.R <- acos(tmp) * 180 / pi
tmp <- pmin(M2n.cos.R, 1)
tmp[tmp > 1-(1e-12)] <- 1 # clamping function of dist.matrix()
M2.deg.R <- acos(tmp) * 180 / pi

M1.deg.ws <- dist.matrix(M1, method="cosine", convert=TRUE, normalized=FALSE)
M2.deg.ws <- dist.matrix(M2, method="cosine", convert=TRUE, normalized=FALSE)

stopifnot(matrix.equal(M1.deg.ws, M1.deg.R))
stopifnot(matrix.equal(M2.deg.ws, M2.deg.R))
stopifnot(all(diag(M1.deg.ws) == 0)) # clamping effect guarantees exact zeroes
stopifnot(all(diag(M2.deg.ws) == 0))
