library(ttTensor)


### Name: skeleton.decomp
### Title: Skeleton Decomposition
### Aliases: skeleton.decomp
### Keywords: methods

### ** Examples

library("Matrix")
# Matrix data
X3 <- matrix(runif(10*20), nrow=10)
X3 <- as(X3, "sparseMatrix")
# Skeleton Decomposition
out.SKD <- skeleton.decomp(X3, r=3, num.iter=2, thr=1E-5)



