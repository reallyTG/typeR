library(BSL)


### Name: gaussianSynLike
### Title: Estimating the Gaussian synthetic likelihood
### Aliases: gaussianSynLike

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

# the standard Gaussian synthetic likelihood (the likelihood estimator used in BSL)
gaussianSynLike(y, x)
# the Gaussian synthetic likelihood with glasso shrinkage estimation
# (the likelihood estimator used in BSLasso)
gaussianSynLike(y, x, shrinkage = 'glasso', penalty = 0.1)




