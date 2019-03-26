library(matrixNormal)


### Name: vec
### Title: Stacks a Matrix using matrix operator "vec"
### Aliases: vec
### Keywords: distribution matrix

### ** Examples

M <- matrix(c(4,5,6,7,8,9), nrow=3)
M
#Compare vec from \pkg{matrixcalc} and new function.
matrixcalc::vec(M)
vec(M)
#The names are rownames(M):colnames(M) in that order.
#Very similar to matrixcalc but dimension names are different.



