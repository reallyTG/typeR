library(klin)


### Name: klin.preparels
### Title: Prepares matrices for the least squares solver
### Aliases: klin.preparels
### Keywords: array

### ** Examples

## dimensions
n <- c(2,4,3)
m <- n+c(1,0,2)			# we need m >= n
## make random matrices
A <- lapply(seq_along(n),
            function(i) Matrix(rnorm(m[i]*n[i]),m[i],n[i]))
b <- rnorm(prod(m))		# make random b
prepA <- klin.preparels(A)
x <- klin.ls(prepA,b)



