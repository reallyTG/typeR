## Validate C code in dsm_score() against pure R implementation
## based on small "hieroglyphs" example matrix

library(wordspace)
library(Matrix)

vec.equal <- function(x, y, tol=1e-12, verbose=TRUE) {
  if (length(x) == length(y)) {
    max.diff <- max(abs(x - y))
    if (verbose && max.diff > max(.Machine$double.eps, .Machine$double.neg.eps)) {
      cat(sprintf("vec.equal: largest difference between vectors = %g\n", max.diff))
    }
    if (max.diff < tol) TRUE else FALSE
  } else {
    if (verbose) cat(sprintf("vec.equal: different vector lengths %d != %d\n", length(x), length(y)))
    FALSE
  }
}

## test data: co-occurrence matrix and corresponding DSM object
M <- DSM_HieroglyphsMatrix
M.dsm <- dsm(M, raw.freq=TRUE)

## marginals and expected frequencies
f1 <- rowSums(M)
f2 <- colSums(M)
N <- sum(M)

M.exp <- outer(f1, f2) / N

stopifnot(vec.equal(f1, M.dsm$rows$f))
stopifnot(vec.equal(f2, M.dsm$cols$f))
stopifnot(vec.equal(N, M.dsm$globals$N))

## validate several score functions and transformations
f <- M # raw co-occurrence frequency
f.dsm <- dsm.score(M.dsm, score="frequency", matrix.only=TRUE)
stopifnot(vec.equal(f, f.dsm))

MI <- pmax(log2(M / M.exp), 0) # sparse pointwise Mutual Information
MI.dsm <- dsm.score(M.dsm, score="MI", matrix.only=TRUE)
stopifnot(vec.equal(MI, MI.dsm))

t <- ifelse(M >= M.exp, (M - M.exp) / sqrt(M), 0) # sparse t-score
t.dsm <- dsm.score(M.dsm, score="t-score", matrix.only=TRUE)
stopifnot(vec.equal(t, t.dsm))

tsqrt.dsm <- dsm.score(M.dsm, score="t-score", transform="root", matrix.only=TRUE) # square root transformation
stopifnot(vec.equal(sqrt(t), tsqrt.dsm))

tlog.dsm <- dsm.score(M.dsm, score="t-score", transform="log", matrix.only=TRUE) # logarithmic transformation
stopifnot(vec.equal(log(t+1), tlog.dsm))

## compare with sparse matrix format
S <- as(M, "sparseMatrix")
stopifnot(dsm.is.canonical(S)$canonical && dsm.is.canonical(S)$sparse)
S.dsm <- dsm(S, raw.freq=TRUE)

f.sparse <- dsm.score(S.dsm, score="frequency", matrix.only=TRUE)
stopifnot(vec.equal(f.dsm, f.sparse))
MI.sparse <- dsm.score(S.dsm, score="MI", matrix.only=TRUE)
stopifnot(vec.equal(MI.dsm, MI.sparse))
t.sparse <- dsm.score(S.dsm, score="t-score", matrix.only=TRUE)
stopifnot(vec.equal(t.dsm, t.sparse))
tsqrt.sparse <- dsm.score(S.dsm, score="t-score", transform="root", matrix.only=TRUE)
stopifnot(vec.equal(tsqrt.dsm, tsqrt.sparse))
tlog.sparse <- dsm.score(S.dsm, score="t-score", transform="log", matrix.only=TRUE)
stopifnot(vec.equal(tsqrt.dsm, tsqrt.sparse))

## column scaling
tsqrt.std <- scale(sqrt(t)) # standardization
tsqrt.std.dsm <- dsm.score(M.dsm, score="t-score", transform="root", scale="standardize", matrix.only=TRUE) 
stopifnot(vec.equal(apply(tsqrt.std.dsm, 2, mean), rep(0, ncol(M))))
stopifnot(vec.equal(apply(tsqrt.std.dsm, 2, sd), rep(1, ncol(M))))
stopifnot(vec.equal(tsqrt.std.dsm, tsqrt.std))

## NB: sparse DSM doesn't allow full standardization unless negative.ok=TRUE (and this is not recommended)

tsqrt.scale <- scale(sqrt(t), center=FALSE) # scale to unit variance without centering
tsqrt.scale.dsm <- dsm.score(M.dsm, score="t-score", transform="root", scale="scale", matrix.only=TRUE)
rms <- function (x) sqrt(sum(x * x) / (length(x) - 1)) # root mean square (cf. ?scale)
stopifnot(vec.equal(apply(tsqrt.scale.dsm, 2, rms), rep(1, ncol(M))))
stopifnot(vec.equal(tsqrt.scale.dsm, tsqrt.scale))

tsqrt.scale.sparse <- dsm.score(S.dsm, score="t-score", transform="root", scale="scale", matrix.only=TRUE) # scale to unit variance without centering
stopifnot(vec.equal(apply(tsqrt.scale.sparse, 2, rms), rep(1, ncol(M))))
stopifnot(vec.equal(tsqrt.scale.sparse, tsqrt.scale))

## row normalization
tsqrt.norm <- sqrt(t) / rowSums(abs(sqrt(t))) # simplest case: Manhattan norm
tsqrt.norm.dsm <- dsm.score(M.dsm, score="t-score", transform="root", normalize=TRUE, method="manhattan", matrix.only=TRUE)
stopifnot(vec.equal(tsqrt.norm.dsm, tsqrt.norm))

tsqrt.norm.sparse <- dsm.score(S.dsm, score="t-score", transform="root", normalize=TRUE, method="manhattan", matrix.only=TRUE)
stopifnot(vec.equal(tsqrt.norm.sparse, tsqrt.norm))
