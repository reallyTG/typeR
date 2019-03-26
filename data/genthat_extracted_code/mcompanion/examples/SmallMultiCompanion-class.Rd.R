library(mcompanion)


### Name: SmallMultiCompanion-class
### Title: A class for small multi-companion matrices
### Aliases: SmallMultiCompanion-class
###   coerce,SmallMultiCompanion,matrix-method
###   initialize,SmallMultiCompanion-method
### Keywords: classes

### ** Examples

mat2 <- make_mcmatrix(eigval = c(1), co = cbind(c(1,1,1,1), c(0,1,0,0)), dim = 4,
len.block = c(2))
mat2
## Jordan decomp. of mat2[1:2,1:2]:
x2 <- matrix(c(1,1,-1,0), ncol =2)
jd <- matrix(c(1,0,1,1), ncol = 2)
mat2[1:2,1:2] - x2 %*% jd %*% solve(x2)
jdobj <- JordanDecomposition(values = 1, vectors = x2, heights = 2)

m1 <- new("SmallMultiCompanion", mat2[1:2, 1:2], Mbot = mat2[3:4, 1:2], jdMtop = jdobj)
m1a <- new("SmallMultiCompanion", Mbot = mat2[3:4, 1:2], jdMtop = jdobj)
as.matrix(m1) - as.matrix(m1a)  # (approx.) 0's



