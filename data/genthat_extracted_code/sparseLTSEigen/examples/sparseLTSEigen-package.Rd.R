library(sparseLTSEigen)


### Name: sparseLTSEigen-package
### Title: RcppEigen back end for sparse least trimmed squares regression
### Aliases: sparseLTSEigen-package sparseLTSEigen .CallSparseLTSEigen
### Keywords: package

### ** Examples

# example is not high-dimensional to keep computation time low
library("mvtnorm")
set.seed(1234)  # for reproducibility
n <- 100  # number of observations
p <- 25   # number of variables
beta <- rep.int(c(1, 0), c(5, p-5))  # coefficients
sigma <- 0.5      # controls signal-to-noise ratio
epsilon <- 0.1    # contamination level
Sigma <- 0.5^t(sapply(1:p, function(i, j) abs(i-j), 1:p))
x <- rmvnorm(n, sigma=Sigma)    # predictor matrix
e <- rnorm(n)                   # error terms
i <- 1:ceiling(epsilon*n)       # observations to be contaminated
e[i] <- e[i] + 5                # vertical outliers
y <- c(x %*% beta + sigma * e)  # response
x[i,] <- x[i,] + 5              # bad leverage points

## fit sparse LTS model
# since package sparseLTSEigen is loaded, its back end based on 
# the C++ library Eigen is used rather than the back end built 
# into package robustHD, except on 32-bit R for Windows
fit <- sparseLTS(x, y, lambda = 0.05, mode = "fraction")
coef(fit, zeros = FALSE)



