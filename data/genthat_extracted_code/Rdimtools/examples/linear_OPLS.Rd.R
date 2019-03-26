library(Rdimtools)


### Name: do.opls
### Title: Orthogonal Partial Least Squares
### Aliases: do.opls

### ** Examples

## generate 2 normal data matrices
mat1 = matrix(rnorm(100*12),nrow=100)+10 # 12-dim normal
mat2 = matrix(rnorm(100*6), nrow=100)-10 # 6-dim normal

## compare OPLS and PLS
res_opls = do.opls(mat1, mat2, ndim=2)
res_pls  = do.pls(mat1, mat2, ndim=2)

## visualize
par(mfrow=c(1,2))
plot(res_opls$Y[,1], res_opls$Y[,2], main="OPLS result")
plot(res_pls$Y1[,1], res_pls$Y1[,2], main="PLS result")




