library(tensorBSS)


### Name: mModeCovariance
### Title: The m-Mode Covariance Matrix
### Aliases: mModeCovariance
### Keywords: utilities array

### ** Examples

## Generate sample data.
n <- 100
x <- t(cbind(rnorm(n, mean = 0),
             rnorm(n, mean = 1),
             rnorm(n, mean = 2),
             rnorm(n, mean = 3),
             rnorm(n, mean = 4),
             rnorm(n, mean = 5)))
             
dim(x) <- c(3, 2, n)

# The m-mode covariance matrices of the first and second modes
mModeCovariance(x, 1)
mModeCovariance(x, 2)



