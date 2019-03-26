library(tensorBSS)


### Name: tensorStandardize
### Title: Standardize an Observation Array
### Aliases: tensorStandardize
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

# Standardize
z <- tensorStandardize(x)$x

# The m-mode covariance matrices of the standardized tensors
mModeCovariance(z, 1)
mModeCovariance(z, 2)



