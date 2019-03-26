library(rrcov3way)


### Name: krp
### Title: Function to compute Khatri-Rao product
### Aliases: krp

### ** Examples

A <- matrix(1, nrow=5, ncol=2)
B <- matrix(1:4, ncol=2)
krp(A,B)

A <- matrix(1:10, ncol=2, byrow=TRUE)
B <- diag(1,2)
krp(A,B)



