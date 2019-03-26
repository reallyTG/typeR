library(bdsmatrix)


### Name: solve.gchol
### Title: Solve a matrix equation using the generalized Cholesky
###   decompostion
### Aliases: solve.gchol
### Keywords: array

### ** Examples

# Create a matrix that is symmetric, but not positive definite
#   The matrix temp has column 6 redundant with cols 1-5
smat <- matrix(1:64, ncol=8)
smat <- smat + t(smat) + diag(rep(20,8))  #smat is 8 by 8 symmetric
temp <-  smat[c(1:5, 5:8), c(1:5, 5:8)]
ch1  <- gchol(temp)

ginv <- solve(ch1, full=FALSE)  # generalized inverse of ch1
tinv <- solve(ch1, full=TRUE)   # generalized inverse of temp
all.equal(temp %*% tinv %*% temp, temp)



