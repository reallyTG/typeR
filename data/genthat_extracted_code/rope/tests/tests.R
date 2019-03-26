library(rope)

testres <- function(res) {
  if (dim(res$selection)[1] != 2) {
    stop('nrow of selection should be equal to number of fdr targets')
  }
  if (dim(res$selection)[2] != 1128) {
    stop('width of selection should be equal to width of input')
  }
  if (length(res$q) != 1128) {
    stop('length of q should be equal to width of input')
  }
  if (min(res$selection) != 0 || max(res$selection) != 1 ||
      sum(res$selection[1, ]) <= 0 || sum(res$selection[1, ]) >= 1128 ||
      any(!is.logical(res$selection))) {
    stop('selection does not make sense')
  }
  if (min(res$q) < 0 || max(res$q) > 1 || sum(res$q) <= 0 || sum(res$q) >= 1128) {
    stop('q does not make sense')
  }
  if (any(res$q[1001:1128] > 0.1) || sum(res$q[1:1000] < 0.15) > 10) {
    stop('q is too bad')
  }
}

# test basic use
set.seed(1)
x <- t(sapply(c(0.01, 0.05, 0.1),
  function(p) c(rbinom(1000, 50, p), rbinom(128, 50, 0.99))))
res <- rope(x, 50, c(0.1, 0.2), mc.cores=1)
testres(res)

# test with sparse input
y <- Matrix::Matrix(x, sparse=TRUE)
res <- rope(y, 50, c(0.1, 0.2), mc.cores=1)
testres(res)

# test with graph/matrix input
z <- lapply(1:3, function(i) vector2symmetric.matrix(x[i, ]))
res <- ropegraph(z, 50, c(0.1, 0.2), mc.cores=1)
res$q <- symmetric.matrix2vector(res$q)
res$selection <- do.call(rbind, lapply(1:2, function(i) {
  symmetric.matrix2vector(res$selection[[i]])
}))
testres(res)

# test with sparse graph/matrix input
z <- lapply(1:3, function(i) {
  Matrix::Matrix(vector2symmetric.matrix(x[i, ]), sparse=TRUE)
})
res <- ropegraph(z, 50, c(0.1, 0.2), mc.cores=1)
res$q <- symmetric.matrix2vector(res$q)
res$selection <- do.call(rbind, lapply(1:2, function(i) {
  symmetric.matrix2vector(res$selection[[i]])
}))
testres(res)
