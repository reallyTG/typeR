library(klin)


### Name: klin.eval
### Title: Evaluate Kronecker product times a vector
### Aliases: klin.eval
### Keywords: array

### ** Examples

## dimensions
n <- c(6,5,3)
m <- c(4,7,2)
## make random matrices
A <- lapply(seq_along(n),
            function(i) Matrix(rnorm(m[i]*n[i]),m[i],n[i]))
x <- rnorm(prod(n))		# make random x
b1 <- klin.klist(A) %*% x     # brute force way
b2 <- klin.eval(A, x)           # using klin.eval
range(b1-b2)			# should be small



