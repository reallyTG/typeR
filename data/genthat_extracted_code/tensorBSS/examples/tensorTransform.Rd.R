library(tensorBSS)


### Name: tensorTransform
### Title: Linear Transformation of Tensors from mth Mode
### Aliases: tensorTransform
### Keywords: utilities array

### ** Examples

# Generate sample data.
n <- 10
x <- t(cbind(rnorm(n, mean = 0),
             rnorm(n, mean = 1),
             rnorm(n, mean = 2),
             rnorm(n, mean = 3),
             rnorm(n, mean = 4),
             rnorm(n, mean = 5)))

dim(x) <- c(3, 2, n)

# Transform from the second mode
A <- matrix(c(2, 1, 0, 3), 2, 2)
z <- tensorTransform(x, A, 2)

# Compare
z[, , 1]
x[, , 1]%*%t(A)



