library(geigen)


### Name: gsvd
### Title: Generalized Singular Value Decomposition
### Aliases: gsvd
### Keywords: algebra array

### ** Examples

A <- matrix(c(1,2,3,3,2,1,4,5,6,7,8,8), nrow=2, byrow=TRUE)
B <- matrix(1:18,byrow=TRUE, ncol=6)
A
B

z <- gsvd(A,B)
z



