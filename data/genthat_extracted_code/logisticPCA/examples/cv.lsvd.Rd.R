library(logisticPCA)


### Name: cv.lsvd
### Title: CV for logistic SVD
### Aliases: cv.lsvd

### ** Examples

# construct a low rank matrix in the logit scale
rows = 100
cols = 10
set.seed(1)
mat_logit = outer(rnorm(rows), rnorm(cols))

# generate a binary matrix
mat = (matrix(runif(rows * cols), rows, cols) <= inv.logit.mat(mat_logit)) * 1.0

## Not run: 
##D negloglikes = cv.lsvd(mat, ks = 1:9)
##D plot(negloglikes)
## End(Not run)



