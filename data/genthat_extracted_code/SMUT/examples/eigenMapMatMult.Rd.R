library(SMUT)


### Name: eigenMapMatMult
### Title: Matrix multiplication using RcppEigen
### Aliases: eigenMapMatMult

### ** Examples

library(SMUT)
A=matrix(1:9,3,3)
A=A+0
B=as.matrix(c(5.0, 2.0, 0.0))
eigenMapMatMult(A,B)
# the result is the same as A %*% B

# Thanks for using our R package SMUT ~~



