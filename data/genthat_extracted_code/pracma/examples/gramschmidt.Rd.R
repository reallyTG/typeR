library(pracma)


### Name: gramSchmidt
### Title: Gram-Schmidt
### Aliases: gramSchmidt
### Keywords: array

### ** Examples

##  QR decomposition
A <- matrix(c(0,-4,2, 6,-3,-2, 8,1,-1), 3, 3, byrow=TRUE)
gs <- gramSchmidt(A)
(Q <- gs$Q); (R <- gs$R)
Q %*% R  # = A



