library(Matrix, quietly=TRUE)
library(sparsesvd)

## Stress test:
##  - apply sparsesvd() to a large number of random sparse nonnegative matrices
##  - check that original matrix M can be reconstructed with reasonable accuracy
##  - compare truncated SVD against first components of full SVD

## Run interactively with:
##   R --slave -f stress_test.R --args <n.run> <k> <n> <r> <torture?> <fillrate> <tol>
## (all arguments are optional with default values set below)
argv <- commandArgs(trailingOnly=TRUE)
argc <- length(argv)

## arguments and their default values
n.run    <- if (argc >= 1) as.integer(argv[1]) else 100   # number of runs
k        <- if (argc >= 2) as.integer(argv[2]) else 500   # k = number of rows of M
n        <- if (argc >= 3) as.integer(argv[3]) else 100   # n = number of columns of M
r        <- if (argc >= 4) as.integer(argv[4]) else 10    # r = rank of truncated SVD
torture  <- if (argc >= 5) as.logical(argv[5]) else FALSE # run with gctorture()?
fillrate <- if (argc >= 6) as.numeric(argv[6]) else .10   # fill rate of sparse matrix (10%)
tol      <- if (argc >= 7) as.numeric(argv[7]) else 1e-6  # acceptable approx. error per cell

cat("sparsesvd() Stress Test:\n")
cat(sprintf(" - %d runs testing full and rank-%d sparse SVD\n", n.run, r))
cat(sprintf(" - based on %d x %d nonnegative matrix with %.1f%% nonzero cells\n", k, n, 100 * fillrate))
cat(sprintf(" - reconstruction accuracy < %g, gctorture() is %s\n", tol, if (torture) "ON" else "OFF"))

## approximate matrix comparison
assert.mat.equal <- function (x, y, tol=1e-6, msg="") {
  if (!all(dim(x) ==  dim(y))) stop(sprintf("error: matrix dimensions differ %s", msg))
  err <- max(abs(x - y))
  if (err > tol) stop(sprintf("approximation error %g > tolerance %g %s", err, tol, msg))
}

## now perform n.run iterations of the test procedure
gctorture(torture)

pb <- txtProgressBar(min=0, max=n.run, style=3)
for (i in 1:n.run) {
  setTxtProgressBar(pb, i)
  x <- ifelse(runif(k * n) < fillrate, runif(k * n), 0)
  M <- matrix(x, k, n) # random non-negative matrix with specified fill rate
  Ms <- Matrix(M, sparse=TRUE)

  ## complete sparse SVD
  svdM <- sparsesvd(Ms)
  R <- with(svdM, u %*% diag(d) %*% t(v)) # reconstructed matrix
  assert.mat.equal(R, M, tol=tol, msg=sprintf("(full SVD at iteration #%d)", i))

  ## complete sparse SVD of transposed matrix
  svdMt <- sparsesvd(t(Ms))
  R <- with(svdMt, v %*% diag(d) %*% t(u)) # reconstructed matrix
  assert.mat.equal(R, M, tol=tol, msg=sprintf("(full transposed SVD at iteration #%d)", i))

  Mr <- with(svdM, u[, 1:r] %*% diag(d[1:r]) %*% t(v[, 1:r])) # r-dimensional approximation

  ## truncated sparse SVD
  svdMr <- sparsesvd(Ms, rank=r)
  Rr <- with(svdMr, u %*% diag(d) %*% t(v)) # reconstructed r-dim approximation
  assert.mat.equal(Rr, Mr, tol=tol, msg=sprintf("(%d-rank truncated SVD at iteration #%d)", r, i))

  ## truncated sparse SVD of transposed matrix
  svdMrt <- sparsesvd(t(Ms), rank=r)
  Rr <- with(svdMrt, v %*% diag(d) %*% t(u)) # reconstructed r-dim approximation
  assert.mat.equal(Rr, Mr, tol=tol, msg=sprintf("(%d-rank truncated transposed SVD at iteration #%d)", r, i))
}
close(pb)
