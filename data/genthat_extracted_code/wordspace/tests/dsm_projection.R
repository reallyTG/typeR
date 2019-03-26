## Validate SVD and other latent subspace projections
## based on small "hieroglyphs" example matrix

library(wordspace)
library(Matrix)

matrix.equal <- function(x, y, name="matrix comparison", tol=1e-12, ignore.sign=FALSE, verbose=TRUE) {
  if (nrow(x) == nrow(y) && ncol(x) == ncol(y)) {
    if (ignore.sign) {
      ## sign of columns is arbitrary in SVD projection
      max.diff.col.1 <- apply(abs(x - y), 2, max) # max diff in each column (same sign)
      max.diff.col.2 <- apply(abs(x + y), 2, max) # max diff in each column (opposite sign)
      max.diff <- max(pmin(max.diff.col.1, max.diff.col.2)) # pick smaller diff for each col, then take maximum
    } else {
      max.diff <- max(abs(x - y))
    }
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

dist.compare <- function (M1, M2, label="TODO", verbose=TRUE, method="euclidean", tol=0.3) { # tol = proportion of average distance (for matrix with larger distances)
  stopifnot(nrow(M1) == nrow(M2))
  nr <- nrow(M1)
  M1 <- dist.matrix(M1, method=method)
  M2 <- dist.matrix(M2, method=method)
  n <- nr * (nr - 1)
  sum1 <- sum(M1) / n
  sum2 <- sum(M2) / n
  d <- sqrt(sum((M1 - M2)^2) / n) # root mean squared difference
  rel.error <- d / max(sum1, sum2)
  if (verbose) cat(sprintf("%s: average difference = %.1f, relative error = %4.1f%%\n", label, d, 100 * rel.error))
  if (rel.error > tol) stop("relative error exceeds tolerance limit")
  invisible(rel.error)
}

## test data: sparse co-occurrence matrix in sparse and dense representation
O <- DSM_HieroglyphsMatrix
E <- outer(rowSums(O), colSums(O)) / sum(O)
M1 <- scale((O - E) / sqrt(E), center=TRUE, scale=FALSE)  # z-score (signed), centered (so SVD projection == PCA)
M2 <- as(M1, "dgCMatrix") # force sparse matrix representation to test sparse algorithms


## full-rank SVD decomposition
svd.R <- svd(M1, nu=6, nv=6)
proj.R <- svd.R$u %*% diag(svd.R$d) # projection into SVD space
approx.R <- proj.R %*% t(svd.R$v)   # matrix approximation

proj.ws <- dsm.projection(M1, method="svd", n=6, with.basis=TRUE)
approx.ws <- proj.ws %*% t(attr(proj.ws, "basis"))

dist.compare(proj.R, M1, label="Full-rank SVD projection (R)", tol=.001)
dist.compare(approx.R, M1, label="Full-rank SVD approximation (R)", tol=.001)
stopifnot(matrix.equal(approx.R, M1, tol=1e-6))

dist.compare(proj.ws, M1, label="Full-rank SVD projection (R)", tol=.001)
dist.compare(approx.ws, M1, label="Full-rank SVD approximation (R)", tol=.001)
stopifnot(matrix.equal(approx.ws, M2, tol=1e-6))


## SVD projection
svd.R <- svd(M1, nu=3, nv=3)
proj.R <- svd.R$u %*% diag(svd.R$d[1:3]) # projection into SVD space
proj.ws <- dsm.projection(M1, method="svd", n=3)
proj.ws.sparse <- dsm.projection(M2, method="svd", n=3)

dist.compare(proj.R, proj.ws, label="Truncated SVD projection (R vs. wordspace)", tol=.001)
dist.compare(proj.R, M1, label="Truncated SVD projection (R)", tol=.2) # relative error should be ca. 10% 
dist.compare(proj.ws, M1, label="Truncated dense SVD projection (wordspace)", tol=.2)
dist.compare(proj.ws.sparse, M2, label="Truncated sparse SVD projection (wordspace)", tol=.2)
dist.compare(proj.ws, proj.ws.sparse, label="Truncated SVD projection (wordspace dense vs. sparse)", tol=.001)

stopifnot(matrix.equal(proj.R, proj.ws, tol=1e-6, ignore.sign=TRUE)) # must ignore arbitrary sign of SVD dims
stopifnot(matrix.equal(proj.R, proj.ws.sparse, tol=1e-6, ignore.sign=TRUE))


## verify power scaling for dense and sparse SVD
proj.ws.p2 <- dsm.projection(M1, method="svd", n=3, power=2)        # dense
stopifnot(matrix.equal(proj.ws.p2, svd.R$u %*% diag(svd.R$d[1:3]^2), tol=1e-6, ignore.sign=TRUE))
proj.ws.sparse.p2 <- dsm.projection(M2, method="svd", n=3, power=2) # sparse
stopifnot(matrix.equal(proj.ws.sparse.p2, proj.ws.p2, tol=1e-6, ignore.sign=TRUE))

stopifnot(matrix.equal(proj.ws.p2, scaleMargins(proj.ws, cols=attr(proj.ws, "sigma")), tol=1e-6)) # post-hoc power scaling
stopifnot(matrix.equal(proj.ws.sparse.p2, scaleMargins(proj.ws.sparse, cols=attr(proj.ws, "sigma")), tol=1e-6))

proj.ws.p0 <- dsm.projection(M1, method="svd", n=3, power=0)       # whitening
stopifnot(matrix.equal(proj.ws.p0, svd.R$u, tol=1e-6, ignore.sign=TRUE))


## full-rank randomized SVD
set.seed(42)
rsvd.proj.ws <- dsm.projection(M1, method="rsvd", n=6, oversampling=2, with.basis=TRUE)
rsvd.approx.ws <- rsvd.proj.ws %*% t(attr(rsvd.proj.ws, "basis"))
set.seed(42)
rsvd.proj.ws.sparse <- dsm.projection(M2, method="rsvd", n=6, oversampling=2, with.basis=TRUE)
rsvd.approx.ws.sparse <- rsvd.proj.ws.sparse %*% t(attr(rsvd.proj.ws.sparse, "basis"))

dist.compare(rsvd.proj.ws, M1, "Full-rank dense rSVD (wordspace)", tol=.001)
matrix.equal(rsvd.approx.ws, M1, tol=1e-6)
dist.compare(rsvd.proj.ws.sparse, M2, "Full-rank sparse rSVD (wordspace)", tol=.001)
matrix.equal(rsvd.approx.ws.sparse, M2, tol=1e-6)


## randomized SVD projection (with intermediate full rank)
set.seed(42)
rsvd.proj.ws <- dsm.projection(M1, method="rsvd", n=3, oversampling=3)
set.seed(42)
rsvd.proj.ws.sparse <- dsm.projection(M2, method="rsvd", n=3, oversampling=3)

dist.compare(rsvd.proj.ws, M1, "Truncated dense rSVD projection (wordspace)", tol=.2) # should be equivalent to full SVD
dist.compare(rsvd.proj.ws, proj.ws, "Truncated dense rSVD vs. SVD projection (wordspace)", tol=.001)
dist.compare(rsvd.proj.ws.sparse, M2, "Truncated sparse rSVD projection (wordspace)", tol=.2) # should be equivalent to full SVD
dist.compare(rsvd.proj.ws.sparse, proj.ws.sparse, "Truncated sparse rSVD vs. SVD projection (wordspace)", tol=.001)


## randomized SVD projection (with reduced intermediate rank)
set.seed(42)
rsvd.proj.ws <- dsm.projection(M1, method="rsvd", n=2, oversampling=2)
set.seed(42)
rsvd.proj.ws.sparse <- dsm.projection(M2, method="rsvd", n=2, oversampling=2)

dist.compare(rsvd.proj.ws, M1, "Truncated dense rSVD (n=2, wordspace)", tol=.35) # relative error should be ca. 30%
dist.compare(rsvd.proj.ws.sparse, M2, "Truncated sparse rSVD (n=2, wordspace)", tol=.35)
dist.compare(rsvd.proj.ws, rsvd.proj.ws.sparse, "Truncated sparse vs. dense rSVD (n=2, wordspace)", tol=.001) # should be identical


## random indexing (with completely filled random vectors)
relerr.dense <- sapply(1:100, function (k) {
  set.seed(k)
  ri.proj.ws <- dsm.projection(M1, method="ri", n=3, rate=1, verbose=FALSE)
  dist.compare(ri.proj.ws, M1, verbose=FALSE, tol=1)
})

relerr.sparse <- sapply(1:100, function (k) {
  set.seed(k)
  ri.proj.ws <- dsm.projection(M2, method="ri", n=3, rate=1, verbose=FALSE)
  dist.compare(ri.proj.ws, M2, verbose=FALSE, tol=1)
})

cat(sprintf("Relative error for dense RI (n=3, wordspace):  %4.1f +/- %4.1f %%\n", 100 * mean(relerr.dense), 100 * sd(relerr.dense)))
cat(sprintf("Relative error for sparse RI (n=3, wordspace): %4.1f +/- %4.1f %%\n", 100 * mean(relerr.sparse), 100 * sd(relerr.sparse)))
res <- t.test(relerr.dense, relerr.sparse)
cat(sprintf(" - t-test for difference in means:  p = %.3f\n", res$p.value))

stopifnot(min(relerr.dense) < .3)
stopifnot(median(relerr.dense) < .5)
stopifnot(min(relerr.sparse) < .3)
stopifnot(median(relerr.sparse) < .5)
stopifnot(res$p.value > .01) # with completely filled random vectors, both methods should have similar performance 

