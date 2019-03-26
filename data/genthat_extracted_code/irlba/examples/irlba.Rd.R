library(irlba)


### Name: irlba
### Title: Find a few approximate singular values and corresponding
###   singular vectors of a matrix.
### Aliases: irlba

### ** Examples

set.seed(1)

A <- matrix(runif(400), nrow=20)
S <- irlba(A, 3)
S$d

# Compare with svd
svd(A)$d[1:3]

# Restart the algorithm to compute more singular values
# (starting with an existing solution S)
S1 <- irlba(A, 5, v=S)

# Estimate smallest singular values
irlba(A, 3, smallest=TRUE)$d

#Compare with
tail(svd(A)$d, 3)

# Principal components (see also prcomp_irlba)
P <- irlba(A, nv=1, center=colMeans(A))

# Compare with prcomp and prcomp_irlba (might vary up to sign)
cbind(P$v,
      prcomp(A)$rotation[, 1],
      prcomp_irlba(A)$rotation[, 1])

# A custom matrix multiplication function that scales the columns of A
# (cf the scale option). This function scales the columns of A to unit norm.
col_scale <- sqrt(apply(A, 2, crossprod))
setClass("scaled_matrix", contains="matrix", slots=c(scale="numeric"))
setMethod("%*%", signature(x="scaled_matrix", y="numeric"),
   function(x ,y) x@.Data %*% (y / x@scale))
setMethod("%*%", signature(x="numeric", y="scaled_matrix"),
   function(x ,y) (x %*% y@.Data) / y@scale)
a <- new("scaled_matrix", A, scale=col_scale)
irlba(a, 3)$d

# Compare with:
svd(sweep(A, 2, col_scale, FUN=`/`))$d[1:3]





