library(OmicsPLS)


### Name: orth
### Title: Orthogonalize a matrix
### Aliases: orth

### ** Examples

orth(c(3,4))
round(crossprod(orth(matrix(rnorm(500),100,5))),4)
orth(matrix(1:9,3,3),type='QR')[,1] - orth(1:3); orth(matrix(1:9,3,3),type='SVD')[,1] - orth(1:3);



