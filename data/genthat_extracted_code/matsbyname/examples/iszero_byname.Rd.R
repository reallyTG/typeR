library(matsbyname)


### Name: iszero_byname
### Title: Test whether this is the zero matrix
### Aliases: iszero_byname

### ** Examples

zero <- matrix(0, nrow = 50, ncol = 50)
iszero_byname(zero)
nonzero <- matrix(1:4, nrow = 2)
iszero_byname(nonzero)
# Also works for lists
iszero_byname(list(zero, nonzero))
# And it works for data frames
DF <- data.frame(A = I(list()), B = I(list()))
DF[[1,"A"]] <- zero
DF[[2,"A"]] <- nonzero
DF[[1,"B"]] <- nonzero
DF[[2,"B"]] <- zero
iszero_byname(DF$A)
iszero_byname(DF$B)
iszero_byname(matrix(1e-10, nrow = 2))
iszero_byname(matrix(1e-10, nrow = 2), tol = 1e-11)



