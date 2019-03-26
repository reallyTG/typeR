library(logisticPCA)


### Name: logisticPCA
### Title: Logistic Principal Component Analysis
### Aliases: logisticPCA

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

# run logistic PCA on it
lpca = logisticPCA(mat, k = 1, m = 4, main_effects = FALSE)

# Logistic PCA likely does a better job finding latent features
# than standard PCA
plot(svd(mat_logit)$u[, 1], lpca$PCs[, 1])
plot(svd(mat_logit)$u[, 1], svd(mat)$u[, 1])



