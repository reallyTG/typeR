library(deepgmm)


### Name: deepgmm
### Title: Fits Deep Gaussian Mixture Models Using Stochastic EM algorithm.
### Aliases: deepgmm
### Keywords: cluster models multivariate

### ** Examples

layers <- 2
k <- c(3, 4) 
r <- c(3, 2)
it <- 50
eps <- 0.001
y <- scale(mtcars)

set.seed(1)
fit <-deepgmm(y = y, layers = layers, k = k, r = r,
                  it = it, eps = eps)
fit

summary(fit)



