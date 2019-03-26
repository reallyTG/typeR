library(klin)


### Name: klin.ls
### Title: Solves a least squares problem where the matrix is a Kronecker
###   product
### Aliases: klin.ls
### Keywords: array

### ** Examples

## dimensions
n <- c(2,4,3)
m <- n+c(1,0,2)			# we need m >= n
## make random matrices
A <- lapply(seq_along(n),
            function(i) Matrix(rnorm(m[i]*n[i]),m[i],n[i]))
b <- rnorm(prod(m))		# make random b
x <- klin.ls(A,b)



