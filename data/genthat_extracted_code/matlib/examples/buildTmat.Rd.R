library(matlib)


### Name: buildTmat
### Title: Build/Get tranformation matricies
### Aliases: buildTmat as.matrix.trace print.trace

### ** Examples

A <- matrix(c(2, 1, -1,
             -3, -1, 2,
             -2,  1, 2), 3, 3, byrow=TRUE)
b <- c(8, -11, -3)

# using row operations to reduce below diagonal to 0
Abt <- Ab <- cbind(A, b)
Abt <- rowadd(Abt, 1, 2, 3/2)
Abt <- rowadd(Abt, 1, 3, 1)
Abt <- rowadd(Abt, 2, 3, -4)
Abt

# build T matrix and multiply by original form
(T <- buildTmat(Abt))
T %*% Ab    # same as Abt

# print all transformation matricies
buildTmat(Abt, TRUE)

# invert transformation matrix to reverse operations
inv(T) %*% Abt

# gaussian elimination
(soln <- gaussianElimination(A, b))
T <- buildTmat(soln)
inv(T) %*% soln




