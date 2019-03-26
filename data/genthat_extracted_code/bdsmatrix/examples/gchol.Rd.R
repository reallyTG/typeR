library(bdsmatrix)


### Name: gchol
### Title: Generalized Cholesky decompostion
### Aliases: gchol
### Keywords: array

### ** Examples

# Create a matrix that is symmetric, but not positive definite
#   The matrix temp has column 6 redundant with cols 1-5
smat <- matrix(1:64, ncol=8)
smat <- smat + t(smat) + diag(rep(20,8))  #smat is 8 by 8 symmetric
temp <-  smat[c(1:5, 5:8), c(1:5, 5:8)]
ch1  <- gchol(temp)

print(as.matrix(ch1), digits=4)   # print out L
print(diag(ch1))        # Note the zero at position 6

ginv <- solve(ch1)    # generalized inverse
diag(ginv)            # also has column 6 marked as singular



