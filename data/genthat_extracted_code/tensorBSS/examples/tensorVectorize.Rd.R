library(tensorBSS)


### Name: tensorVectorize
### Title: Vectorize an Observation Tensor
### Aliases: tensorVectorize
### Keywords: utilities array

### ** Examples

# Generate sample data.
n <- 100
x <- t(cbind(rnorm(n, mean = 0),
             rnorm(n, mean = 1),
             rnorm(n, mean = 2),
             rnorm(n, mean = 3),
             rnorm(n, mean = 4),
             rnorm(n, mean = 5)))
             
dim(x) <- c(3, 2, n)

# Matrix of vectorized observations.
vecx <- tensorVectorize(x)

# The covariance matrix of individual tensor elements
cov(t(vecx))



