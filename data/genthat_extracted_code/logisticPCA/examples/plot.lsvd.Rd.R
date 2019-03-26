library(logisticPCA)


### Name: plot.lsvd
### Title: Plot logistic SVD
### Aliases: plot.lsvd

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

# run logistic SVD on it
lsvd = logisticSVD(mat, k = 2, main_effects = FALSE, partial_decomp = FALSE)

## Not run: 
##D plot(lsvd)
## End(Not run)



