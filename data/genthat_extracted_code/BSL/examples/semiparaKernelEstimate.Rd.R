library(BSL)


### Name: semiparaKernelEstimate
### Title: Estimating the semi-parametric joint likelihood
### Aliases: semiparaKernelEstimate

### ** Examples

data(ma2)
y <- ma2$data # the observed data

# function that simulates an ma2 time series
simulate_ma2 <- function(theta, L = 50) {
    rand <- rnorm(L + 2)
    y <- rand[3 : (L+2)] + theta[1] * rand[2 : (L+1)] + theta[2] * rand[1 : L]
    return(y)
}

theta_true <- c(0.6, 0.2)
x <- matrix(0, 300, 50)
set.seed(100)
for(i in 1:300) x[i, ] <- simulate_ma2(theta_true)

# the default semi-parametric synthetic likelihood estimator of semiBSL
semiparaKernelEstimate(y, x)
# using shrinkage on the correlation matrix of the Gaussian copula is also possible
semiparaKernelEstimate(y, x, shrinkage = 'Warton', penalty = 0.6)




