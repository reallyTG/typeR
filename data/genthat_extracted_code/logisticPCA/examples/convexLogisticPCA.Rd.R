library(logisticPCA)


### Name: convexLogisticPCA
### Title: Convex Logistic Principal Component Analysis
### Aliases: convexLogisticPCA

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

# run convex logistic PCA on it
clpca = convexLogisticPCA(mat, k = 1, m = 4)



