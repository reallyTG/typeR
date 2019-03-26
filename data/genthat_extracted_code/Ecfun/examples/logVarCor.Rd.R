library(Ecfun)


### Name: logVarCor
### Title: Log-diagonal reprentation of a variance matrix
### Aliases: logVarCor
### Keywords: multivariate

### ** Examples

##
## 1.  Trivial 1 x 1 matrix
##
# 1.1.  convert vector to "matrix"
mat1 <- logVarCor(1)
# check
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(mat1, matrix(exp(1), 1))
## Don't show: 
)
## End(Don't show)          

# 1.2.  Convert 1 x 1 matrix to vector 
lVCd1 <- logVarCor(diag(1))
# check 
lVCd1. <- 0
attr(lVCd1., 'corr') <- numeric(0)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(lVCd1, lVCd1.)
## Don't show: 
)
## End(Don't show)

##
## 2.  simple 2 x 2 matrix 
##
# 2.1.  convert 1:2 into a matrix 
lVC2 <- logVarCor(1:2)
# check 
lVC2. <- diag(exp(1:2))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(lVC2, lVC2.)
## Don't show: 
)
## End(Don't show)

# 2.2.  Convert a matrix into a vector 
lVC2d <- logVarCor(diag(1:2))
# check 
lVC2d. <- log(1:2)
attr(lVC2d., 'corr') <- 0 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(lVC2d, lVC2d.)
## Don't show: 
)
## End(Don't show)

##
## 3.  3-d covariance matrix with nonzero correlations 
##
# 3.1.  Create matrix 
(ex3 <- tcrossprod(matrix(c(rep(1,3), 0:2), 3)))
dimnames(ex3) <- list(letters[1:3], letters[1:3])

# 3.2.  Convert to vector 
(Ex3 <- logVarCor(ex3))

# check 
Ex3. <- log(c(1, 2, 5))
names(Ex3.) <- letters[1:3]
attr(Ex3., 'corr') <- c(1/sqrt(2), 1/sqrt(5), 3/sqrt(10))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(Ex3, Ex3.)
## Don't show: 
)
## End(Don't show)

# 3.3.  Convert back to a matrix 
Ex3.2 <- logVarCor(Ex3)
# check 
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(ex3, Ex3.2)
## Don't show: 
)
## End(Don't show)



