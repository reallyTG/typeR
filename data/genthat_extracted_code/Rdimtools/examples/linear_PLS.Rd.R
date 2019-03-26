library(Rdimtools)


### Name: do.pls
### Title: Partial Least Squares
### Aliases: do.pls

### ** Examples

## generate 2 normal data matrices
mat1 = matrix(rnorm(100*12),nrow=100)+10 # 12-dim normal
mat2 = matrix(rnorm(100*6), nrow=100)-10 # 6-dim normal

## project onto 2 dimensional space for each data
output = do.pls(mat1, mat2, ndim=2)

## visualize
par(mfrow=c(1,2))
plot(output$Y1[,1], output$Y1[,2], main="proj(mat1)")
plot(output$Y2[,1], output$Y2[,2], main="proj(mat2)")




