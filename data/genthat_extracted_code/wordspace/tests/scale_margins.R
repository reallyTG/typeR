## Validate scaleMargins() implementation against pure R code
## based on small "hieroglyphs" example matrix

library(wordspace)
library(Matrix)

matrix.equal <- function(x, y, name="matrix comparison", tol=1e-12, verbose=TRUE) {
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
M1 <- DSM_HieroglyphsMatrix  # dense matrix
M2 <- as(M1, "dgCMatrix")    # canonical sparse matrix

row.weights <- (1:nrow(M1)) - 1
col.weights <- (1:ncol(M1)) * 10


## pure R implementation
scale.rows <- function (M, w) {
  if (length(w) == 1) w <- rep(w, nrow(M))
  stopifnot(length(w) == nrow(M))
  sweep(M, 1, w, FUN="*")
}
scale.cols <- function (M, w) {
  if (length(w) == 1) w <- rep(w, ncol(M))
  stopifnot(length(w) == ncol(M))
  sweep(M, 2, w, FUN="*")
}


## scale rows only (weight vector or constant)
M1.row.R <- scale.rows(M1, row.weights)
M2.row.R <- scale.rows(M2, row.weights)
M1.row.ws <- scaleMargins(M1, rows=row.weights)
M2.row.ws <- scaleMargins(M2, rows=row.weights)

stopifnot(matrix.equal(M1.row.R, M2.row.R))
stopifnot(matrix.equal(M1.row.ws, M1.row.R))
stopifnot(matrix.equal(M2.row.ws, M2.row.R))
stopifnot(!dsm.is.canonical(M1.row.ws)$sparse)
stopifnot(dsm.is.canonical(M2.row.ws)$sparse)

M1.row.R <- scale.rows(M1, 42)
M2.row.R <- scale.rows(M2, 42)
M1.row.ws <- scaleMargins(M1, rows=42)
M2.row.ws <- scaleMargins(M2, rows=42)

stopifnot(matrix.equal(M1.row.R, M2.row.R))
stopifnot(matrix.equal(M1.row.ws, M1.row.R))
stopifnot(matrix.equal(M2.row.ws, M2.row.R))
stopifnot(!dsm.is.canonical(M1.row.ws)$sparse)
stopifnot(dsm.is.canonical(M2.row.ws)$sparse)


## scale columns only (weight vector or constant)
M1.col.R <- scale.cols(M1, col.weights)
M2.col.R <- scale.cols(M2, col.weights)
M1.col.ws <- scaleMargins(M1, cols=col.weights)
M2.col.ws <- scaleMargins(M2, cols=col.weights)

stopifnot(matrix.equal(M1.col.R, M2.col.R))
stopifnot(matrix.equal(M1.col.ws, M1.col.R))
stopifnot(matrix.equal(M2.col.ws, M2.col.R))
stopifnot(!dsm.is.canonical(M1.col.ws)$sparse)
stopifnot(dsm.is.canonical(M2.col.ws)$sparse)

M1.col.R <- scale.cols(M1, 42)
M2.col.R <- scale.cols(M2, 42)
M1.col.ws <- scaleMargins(M1, cols=42)
M2.col.ws <- scaleMargins(M2, cols=42)

stopifnot(matrix.equal(M1.col.R, M2.col.R))
stopifnot(matrix.equal(M1.col.ws, M1.col.R))
stopifnot(matrix.equal(M2.col.ws, M2.col.R))
stopifnot(!dsm.is.canonical(M1.col.ws)$sparse)
stopifnot(dsm.is.canonical(M2.col.ws)$sparse)


## scale both rows and columns (weight vector or constant)
M1.both.R <- scale.rows(scale.cols(M1, col.weights), row.weights)
M2.both.R <- scale.rows(scale.cols(M2, col.weights), row.weights)
M1.both.ws <- scaleMargins(M1, rows=row.weights, cols=col.weights)
M2.both.ws <- scaleMargins(M2, rows=row.weights, cols=col.weights)

stopifnot(matrix.equal(M1.both.R, M2.both.R))
stopifnot(matrix.equal(M1.both.ws, M1.both.R))
stopifnot(matrix.equal(M2.both.ws, M2.both.R))
stopifnot(!dsm.is.canonical(M1.both.ws)$sparse)
stopifnot(dsm.is.canonical(M2.both.ws)$sparse)

M1.both.R <- scale.rows(scale.cols(M1, 42), row.weights)
M2.both.R <- scale.rows(scale.cols(M2, 42), row.weights)
M1.both.ws <- scaleMargins(M1, rows=row.weights, cols=42)
M2.both.ws <- scaleMargins(M2, rows=row.weights, cols=42)

stopifnot(matrix.equal(M1.both.R, M2.both.R))
stopifnot(matrix.equal(M1.both.ws, M1.both.R))
stopifnot(matrix.equal(M2.both.ws, M2.both.R))
stopifnot(!dsm.is.canonical(M1.both.ws)$sparse)
stopifnot(dsm.is.canonical(M2.both.ws)$sparse)

M1.both.R <- scale.rows(scale.cols(M1, col.weights), 42)
M2.both.R <- scale.rows(scale.cols(M2, col.weights), 42)
M1.both.ws <- scaleMargins(M1, rows=42, cols=col.weights)
M2.both.ws <- scaleMargins(M2, rows=42, cols=col.weights)

stopifnot(matrix.equal(M1.both.R, M2.both.R))
stopifnot(matrix.equal(M1.both.ws, M1.both.R))
stopifnot(matrix.equal(M2.both.ws, M2.both.R))
stopifnot(!dsm.is.canonical(M1.both.ws)$sparse)
stopifnot(dsm.is.canonical(M2.both.ws)$sparse)


M1.both.R <- scale.rows(scale.cols(M1, 1/666), 42)
M2.both.R <- scale.rows(scale.cols(M2, 1/666), 42)
M1.both.ws <- scaleMargins(M1, rows=42, cols=1/666)
M2.both.ws <- scaleMargins(M2, rows=42, cols=1/666)

stopifnot(matrix.equal(M1.both.R, M2.both.R))
stopifnot(matrix.equal(M1.both.ws, M1.both.R))
stopifnot(matrix.equal(M2.both.ws, M2.both.R))
stopifnot(!dsm.is.canonical(M1.both.ws)$sparse)
stopifnot(dsm.is.canonical(M2.both.ws)$sparse)


## test in-place operation (internal use only)
M1.orig <- M1 + 0.0 # this should make copies
M2.orig <- M2 + 0.0
M1.both.R <- scale.rows(scale.cols(M1, col.weights), row.weights)
M2.both.R <- scale.rows(scale.cols(M2, col.weights), row.weights)
M1.both.ws <- scaleMargins(M1, rows=row.weights, cols=col.weights)
M2.both.ws <- scaleMargins(M2, rows=row.weights, cols=col.weights)

stopifnot(matrix.equal(M1.both.ws, M1.both.R))
stopifnot(matrix.equal(M2.both.ws, M2.both.R))
stopifnot(matrix.equal(M1, M1.orig)) # with default duplicate=TRUE, copies of M1 and M2 are returned
stopifnot(matrix.equal(M2, M2.orig))

M1.both.ws <- scaleMargins(M1, rows=row.weights, cols=col.weights, duplicate=FALSE)
M2.both.ws <- scaleMargins(M2, rows=row.weights, cols=col.weights, duplicate=FALSE)

stopifnot(matrix.equal(M1.both.ws, M1.both.R))
stopifnot(matrix.equal(M2.both.ws, M2.both.R))
stopifnot(matrix.equal(M1, M1.both.R)) # now M1 and M2 have been modified in-place
stopifnot(matrix.equal(M2, M2.both.R))
## in fact, DSM_HieroglpyhsMatrix will also be affected (since M1 is a reference to the same object)


## a sightly inefficient way to compute outer products
x <- 1:5
y <- c(0.25, 1, 2)
O1 <- outer(y, x)

O2 <- matrix(1, nrow=length(y), ncol=length(x))
O2 <- scaleMargins(O2, cols=x, rows=y, duplicate=FALSE) # avoid extra copy

stopifnot(matrix.equal(O1, O2))
