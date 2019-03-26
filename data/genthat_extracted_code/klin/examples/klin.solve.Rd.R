library(klin)


### Name: klin.solve
### Title: Solve linear systems where the matrix is a Kronecker product
### Aliases: klin.solve
### Keywords: array

### ** Examples

## dimensions
m <- c(4,7,2)
## make random matrices
A <- lapply(seq_along(m),
            function(i) Matrix(rnorm(m[i]^2),m[i],m[i]))
b <- rnorm(prod(m))		# make random b
x1 <- solve(klin.klist(A),b)    # brute force way
x2 <- klin.solve(A, b)          # using klin.eval
range(x1-x2)			# should be small



