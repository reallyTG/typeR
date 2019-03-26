library(logisticPCA)


### Name: logisticSVD
### Title: Logistic Singular Value Decomposition
### Aliases: logisticSVD

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

# run logistic SVD on it
lsvd = logisticSVD(mat, k = 1, main_effects = FALSE, partial_decomp = FALSE)

# Logistic SVD likely does a better job finding latent features
# than standard SVD
plot(svd(mat_logit)$u[, 1], lsvd$A[, 1])
plot(svd(mat_logit)$u[, 1], svd(mat)$u[, 1])



