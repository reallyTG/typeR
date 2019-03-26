library(logisticPCA)


### Name: cv.clpca
### Title: CV for convex logistic PCA
### Aliases: cv.clpca

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

## Not run: 
##D negloglikes = cv.clpca(mat, ks = 1:9, ms = 3:6)
##D plot(negloglikes)
## End(Not run)



