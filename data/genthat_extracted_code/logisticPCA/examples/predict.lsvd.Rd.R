library(logisticPCA)


### Name: predict.lsvd
### Title: Predict Logistic SVD left singular values or reconstruction on
###   new data
### Aliases: predict.lsvd

### ** Examples

# construct a low rank matrices in the logit scale
rows = 100
cols = 10
set.seed(1)
loadings = rnorm(cols)
mat_logit = outer(rnorm(rows), loadings)
mat_logit_new = outer(rnorm(rows), loadings)

# convert to a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0
mat_new = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit_new)) * 1.0

# run logistic PCA on it
lsvd = logisticSVD(mat, k = 1, main_effects = FALSE, partial_decomp = FALSE)

A_new = predict(lsvd, mat_new)



