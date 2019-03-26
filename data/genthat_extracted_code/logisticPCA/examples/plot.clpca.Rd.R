library(logisticPCA)


### Name: plot.clpca
### Title: Plot convex logistic PCA
### Aliases: plot.clpca

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

# run convex logistic PCA on it
clpca = convexLogisticPCA(mat, k = 2, m = 4, main_effects = FALSE)

## Not run: 
##D plot(clpca)
## End(Not run)



