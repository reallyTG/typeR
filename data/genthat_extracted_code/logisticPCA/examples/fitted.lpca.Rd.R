library(logisticPCA)


### Name: fitted.lpca
### Title: Fitted values using logistic PCA
### Aliases: fitted.lpca

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

# construct fitted probability matrix
fit = fitted(lpca, type = "response")



