library(pracma)


### Name: givens
### Title: Givens Rotation
### Aliases: givens
### Keywords: array

### ** Examples

##  QR decomposition
A <- matrix(c(0,-4,2, 6,-3,-2, 8,1,-1), 3, 3, byrow=TRUE)
gv <- givens(A)
(Q <- gv$Q); (R <- gv$R)
zapsmall(Q %*% R)

givens(magic(5))



