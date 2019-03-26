library(parmigene)


### Name: knnmi.cross
### Title: Parallel Mutual Information Estimation Between the Rows of Two
###   Matrices
### Aliases: knnmi.cross

### ** Examples

mat1 <- matrix(rnorm(1000), nrow=10)
mat2 <- matrix(rnorm(1000), nrow=10)
knnmi.cross(mat1, mat2, 5)



