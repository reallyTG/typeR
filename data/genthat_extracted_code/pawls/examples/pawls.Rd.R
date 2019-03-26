library(pawls)


### Name: pawls
### Title: Penalized adaptive weighted least squares regression
### Aliases: pawls

### ** Examples

## generate data
library("mvtnorm")
set.seed(123)  # for reproducibility
n = 100 # number of observations
p = 8 # number of variables
beta = c(1, 2, 3, 0, 0, 0, 0, 0) # coefficients
sigma <- 0.5      # controls signal-to-noise ratio
epsilon <- 0.1    # contamination level
Sigma <- 0.5^t(sapply(1:p, function(i, j) abs(i-j), 1:p))
x <- rmvnorm(n, sigma=Sigma)    # predictor matrix
e <- rnorm(n)                   # error terms
i <- 1:ceiling(epsilon*n)       # observations to be contaminated
e[i] <- e[i] + 5                # vertical outliers
y <- c(x %*% beta + sigma * e)  # response
x[i,] <- x[i,] + 5              # bad leverage points

## fit pawls model over a find grid of tuning parameters
pawls(x,y)

## fit adaptive pawls model over a find grid of tuning parameters
pawls(x,y,lambda1.min = 0.001, lambda2.min = 0.05, initial = "PAWLS")

## fit adaptive pawls model using corss search over a grid of tuning parameters
pawls(x,y,lambda1.min = 0.001, lambda2.min = 0.05, initial = "PAWLS", search="cross")



